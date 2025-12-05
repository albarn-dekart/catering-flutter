import 'package:flutter/material.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';

class SearchableListScreen<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final bool Function(T item, String query) filter;
  final Widget? floatingActionButton;
  final bool isLoading;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final String searchHint;
  final Widget? customFilters;

  const SearchableListScreen({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.filter,
    this.floatingActionButton,
    this.isLoading = false,
    this.onRefresh,
    this.onLoadMore,
    this.searchHint = 'Search...',
    this.customFilters,
  });

  @override
  State<SearchableListScreen<T>> createState() =>
      _SearchableListScreenState<T>();
}

class _SearchableListScreenState<T> extends State<SearchableListScreen<T>> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<T> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onSearchChanged();
    });
  }

  @override
  void didUpdateWidget(SearchableListScreen<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items || widget.filter != oldWidget.filter) {
      _onSearchChanged();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
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
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) => widget.filter(item, query))
          .toList();
    });
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
                hintText: widget.searchHint,
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
            child: widget.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredItems.isEmpty
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
                          'No items found',
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
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      controller: _scrollController,
                      itemCount:
                          _filteredItems.length +
                          (widget.isLoading && widget.onLoadMore != null
                              ? 1
                              : 0),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        if (index == _filteredItems.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return widget.itemBuilder(
                          context,
                          _filteredItems[index],
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
