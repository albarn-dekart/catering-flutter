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
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final String? searchHint;
  final bool useGrid;
  final double? preferredItemHeight;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final Widget? customFilters;
  final void Function(String query)? onSearch;

  const SearchableListScreen({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.floatingActionButton,
    this.isLoading = false,
    this.onRefresh,
    this.onLoadMore,
    this.searchHint,
    this.customFilters,
    this.useGrid = false,
    this.preferredItemHeight,
    this.mainAxisSpacing = 16,
    this.crossAxisSpacing = 16,
    this.onSearch,
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
      floatingActionButton: widget.floatingActionButton,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
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
          if (widget.customFilters != null) widget.customFilters!,
          Expanded(
            child: widget.isLoading && widget.items.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : widget.items.isEmpty
                ? Center(
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
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: widget.onRefresh ?? () async {},
                    child: widget.useGrid
                        ? ResponsiveGridBuilder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _scrollController,
                            padding: const EdgeInsets.all(16),
                            itemCount:
                                widget.items.length +
                                (widget.isLoading && widget.onLoadMore != null
                                    ? 1
                                    : 0),
                            preferredItemHeight:
                                widget.preferredItemHeight ?? 300,
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
                              return widget.itemBuilder(
                                context,
                                widget.items[index],
                              );
                            },
                          )
                        : ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(16),
                            controller: _scrollController,
                            itemCount:
                                widget.items.length +
                                (widget.isLoading && widget.onLoadMore != null
                                    ? 1
                                    : 0),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              if (index >= widget.items.length) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              return widget.itemBuilder(
                                context,
                                widget.items[index],
                              );
                            },
                          ),
                  ),
          ),
        ],
      ),
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
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
