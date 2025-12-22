import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/responsive_grid.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class SearchableListScreen<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Widget? floatingActionButton;
  final bool isLoading;
  final bool isLoadingMore;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final String? searchHint;
  final bool useGrid;
  final double? preferredItemHeight;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final Widget? customFilters;
  final String? errorMessage;
  final bool hasError;
  final VoidCallback? onRetry;
  final void Function(String query)? onSearch;
  final PreferredSizeWidget? bottom;
  final int maxColumns;

  const SearchableListScreen({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.floatingActionButton,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.onRefresh,
    this.onLoadMore,
    this.searchHint,
    this.customFilters,
    this.useGrid = false,
    this.preferredItemHeight,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.onSearch,
    this.errorMessage,
    this.hasError = false,
    this.onRetry,
    this.bottom,
    this.maxColumns = 3,
  });

  @override
  State<SearchableListScreen<T>> createState() =>
      _SearchableListScreenState<T>();
}

class _SearchableListScreenState<T> extends State<SearchableListScreen<T>> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

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

    if (widget.onSearch != null) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        widget.onSearch!(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.title,
      bottom: widget.bottom,
      floatingActionButton: widget.floatingActionButton,
      child: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText:
                    widget.searchHint ?? AppLocalizations.of(context)!.search,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          // Top loading indicator (for refresh/delete operations when items exist)
          if (widget.isLoading && widget.items.isNotEmpty)
            LinearProgressIndicator(
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerLow,
              color: Theme.of(context).colorScheme.primary,
            ),
          // Custom filters
          if (widget.customFilters != null) widget.customFilters!,
          // Main content
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    // Error state (only when no items to show)
    if (widget.hasError && widget.items.isEmpty) {
      return GlobalErrorWidget(
        message: widget.errorMessage,
        onRetry: widget.onRetry,
      );
    }

    // Initial loading state (no items yet)
    if (widget.isLoading && widget.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // Empty state
    if (widget.items.isEmpty) {
      return Center(
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
    }

    // Normal state with items
    return RefreshIndicator(
      onRefresh: widget.onRefresh ?? () async {},
      child: widget.useGrid ? _buildGrid() : _buildList(),
    );
  }

  Widget _buildGrid() {
    final showLoadingMore = widget.isLoadingMore && widget.onLoadMore != null;

    return ResponsiveGridBuilder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: widget.items.length + (showLoadingMore ? 1 : 0),
      preferredItemHeight: widget.preferredItemHeight ?? 300,
      maxColumns: widget.maxColumns,
      mainAxisSpacing: widget.mainAxisSpacing,
      crossAxisSpacing: widget.crossAxisSpacing,
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
      padding: const EdgeInsets.all(16),
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

class FilterChipsBar<T> extends StatelessWidget {
  final List<T> values;
  final T? selectedValue;
  final String Function(T) labelBuilder;
  final ValueChanged<T?> onSelected;
  final String allLabel;

  const FilterChipsBar({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.labelBuilder,
    required this.onSelected,
    required this.allLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildChip(context, null, allLabel),
            ...values.map(
              (value) => _buildChip(context, value, labelBuilder(value)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, T? value, String label) {
    final isSelected = selectedValue == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          if (selectedValue != value) {
            onSelected(value);
          }
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        checkmarkColor: Theme.of(context).colorScheme.primary,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
