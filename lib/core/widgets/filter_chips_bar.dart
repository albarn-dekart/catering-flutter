import 'package:flutter/material.dart';

class FilterChipsBar<T> extends StatelessWidget {
  final List<T> values;
  final T? selectedValue;
  final List<T>? selectedValues; // For multi-select
  final String Function(T) labelBuilder;
  final ValueChanged<T?>? onSelected;
  final ValueChanged<List<T>>? onSelectedList; // For multi-select
  final String? allLabel;
  final bool isMultiSelect;
  final EdgeInsetsGeometry? padding;

  const FilterChipsBar({
    super.key,
    required this.values,
    this.selectedValue,
    this.selectedValues,
    required this.labelBuilder,
    this.onSelected,
    this.onSelectedList,
    this.allLabel,
    this.padding,
  }) : isMultiSelect = onSelectedList != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            if (allLabel != null && !isMultiSelect)
              _buildChip(context, null, allLabel!),
            ...values.map(
              (value) => _buildChip(context, value, labelBuilder(value)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, T? value, String label) {
    final isSelected = isMultiSelect
        ? (selectedValues?.contains(value as T) ?? false)
        : (selectedValue == value);

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: ChoiceChip(
          label: Text(label),
          selected: isSelected,
          onSelected: (selected) {
            if (isMultiSelect) {
              if (onSelectedList != null && value != null) {
                final newList = List<T>.from(selectedValues ?? []);
                if (selected) {
                  newList.add(value);
                } else {
                  newList.remove(value);
                }
                onSelectedList!(newList);
              }
            } else {
              if (onSelected != null && selectedValue != value) {
                onSelected!(value);
              }
            }
          },
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: isSelected
              ? BorderSide.none
              : BorderSide(
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.5,
                  ),
                  width: 1.5,
                ),
          showCheckmark: false,
        ),
      ),
    );
  }
}
