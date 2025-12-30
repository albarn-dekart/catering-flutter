import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';

class SearchableListScreen<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final VoidCallback? onCreate;
  final Widget? headerAction;
  final bool isLoading;
  final bool isLoadingMore;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final String? searchHint;
  final bool useGrid;
  final Widget? customFilters;
  final String? errorMessage;
  final bool hasError;
  final VoidCallback? onRetry;
  final VoidCallback? onCancel;
  final void Function(String query)? onSearch;
  final PreferredSizeWidget? bottom;
  final Widget? header;
  final bool withScaffold;

  const SearchableListScreen({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.onCreate,
    this.headerAction,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.onRefresh,
    this.onLoadMore,
    this.searchHint,
    this.customFilters,
    this.useGrid = false,
    this.onSearch,
    this.errorMessage,
    this.hasError = false,
    this.onRetry,
    this.onCancel,
    this.bottom,
    this.header,
    this.withScaffold = true,
  });

  @override
  State<SearchableListScreen<T>> createState() =>
      _SearchableListScreenState<T>();
}

class _SearchableListScreenState<T> extends State<SearchableListScreen<T>> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _lastSearchQuery = '';

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (widget.onLoadMore != null && !widget.isLoading) {
        widget.onLoadMore!();
      }
    }
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    if (query == _lastSearchQuery) return;

    if (widget.onSearch != null) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        _lastSearchQuery = query;
        widget.onSearch!(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.header != null) ...[
          widget.header!,
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: _searchController,
                labelText:
                    widget.searchHint ?? AppLocalizations.of(context)!.search,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            if (widget.headerAction != null) ...[
              const SizedBox(width: 8),
              widget.headerAction!,
            ],
            if (widget.onCreate != null) ...[
              const SizedBox(width: 8),
              AppPremiumButton(
                onPressed: widget.onCreate,
                icon: Icons.add,
                label: AppLocalizations.of(context)!.add,
                isFullWidth: false,
              ),
            ],
          ],
        ),
        if (widget.customFilters != null) ...[
          const SizedBox(height: 8),
          widget.customFilters!,
        ],
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        // Top loading indicator (for refresh/delete operations when items exist)
        if (widget.isLoading && widget.items.isNotEmpty)
          LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
            color: Theme.of(context).colorScheme.primary,
          ),
        // Main content
        Expanded(child: _buildContent(context)),
      ],
    );

    if (!widget.withScaffold) {
      return content;
    }

    return CustomScaffold(
      title: widget.title,
      bottom: widget.bottom,
      child: content,
    );
  }

  Widget _buildContent(BuildContext context) {
    final onRefresh = widget.onRefresh;

    // Initial loading state (no items yet)
    if (widget.isLoading && widget.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Error state
    if (widget.hasError && widget.items.isEmpty) {
      final errorWidget = GlobalErrorWidget(
        message: widget.errorMessage,
        onRetry: widget.onRetry,
        onCancel: widget.onCancel,
        withScaffold: false,
      );

      return LayoutBuilder(
        builder: (context, constraints) {
          if (onRefresh != null) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Center(child: errorWidget),
                ),
              ),
            );
          }
          return Center(child: errorWidget);
        },
      );
    }

    // Empty state
    if (widget.items.isEmpty) {
      final emptyWidget = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.noItemsFound,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      );

      return LayoutBuilder(
        builder: (context, constraints) {
          if (onRefresh != null) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: emptyWidget,
                ),
              ),
            );
          }
          return emptyWidget;
        },
      );
    }

    // Normal state with items
    final content = widget.useGrid ? _buildGrid() : _buildList();
    if (onRefresh != null) {
      return RefreshIndicator(onRefresh: onRefresh, child: content);
    }
    return content;
  }

  Widget _buildGrid() {
    final showLoadingMore = widget.isLoadingMore && widget.onLoadMore != null;

    return ResponsiveGridBuilder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemCount: widget.items.length + (showLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= widget.items.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget.itemBuilder(context, widget.items[index]);
      },
    );
  }

  Widget _buildList() {
    final showLoadingMore = widget.isLoadingMore && widget.onLoadMore != null;

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      controller: _scrollController,
      itemCount: widget.items.length + (showLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index >= widget.items.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget.itemBuilder(context, widget.items[index]);
      },
    );
  }
}
