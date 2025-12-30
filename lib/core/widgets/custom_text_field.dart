import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final bool enabled;
  final int? maxLines;
  final String? prefixText;
  final String? suffixText;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.autofocus = false,
    this.textInputAction,
    this.onEditingComplete,
    this.enabled = true,
    this.maxLines = 1,
    this.prefixText,
    this.suffixText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: _isObscured,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChanged,
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
        onEditingComplete: widget.onEditingComplete,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        style: theme.textTheme.bodyLarge,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: _isFocused ? null : widget.hintText,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return colorScheme.primary;
            }
            return colorScheme.onSurfaceVariant.withValues(alpha: 0.7);
          }),
          prefixText: widget.prefixText,
          prefixStyle: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : widget.suffixIcon ??
                    (widget.suffixText != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Center(
                              widthFactor: 1,
                              child: Text(
                                widget.suffixText!,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : null),
          suffixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.focused)) {
              return colorScheme.primary;
            }
            return colorScheme.onSurfaceVariant.withValues(alpha: 0.7);
          }),
          filled: true,
          fillColor: colorScheme.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          // Ensure label behaves correctly with rounded corners
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: widget.maxLines != null && widget.maxLines! > 1,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: colorScheme.outline.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: colorScheme.error, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
        ),
      ),
    );
  }
}
