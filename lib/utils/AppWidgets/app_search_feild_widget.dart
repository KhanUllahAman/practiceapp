import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:practiceproject/utils/Colors/colors.dart';
import 'package:practiceproject/utils/ScreenSize/screen_size_utils.dart';

class AppSearchField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final IconData? prefixIcon;
  final bool enabled;
  final bool autofocus;

  const AppSearchField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.prefixIcon,
    this.enabled = true,
    this.autofocus = false,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _internalController;
  late final TextEditingController _activeController;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _internalController = TextEditingController();
    _activeController = widget.controller ?? _internalController;
    _hasText = _activeController.text.isNotEmpty;
    _activeController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasText = _activeController.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  void _handleClear() {
    _activeController.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  @override
  void dispose() {
    _activeController.removeListener(_onTextChanged);
    _internalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsiveHeight(0.058),
      decoration: BoxDecoration(
        color: ColorResources.text(context).withAlpha(7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorResources.text(context).withAlpha(18),
          width: 1,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: ColorResources.appMainColor,
            selectionColor: ColorResources.appMainColor.withAlpha(80),
            cursorColor: ColorResources.appMainColor,
          ),
        ),
        child: TextField(
          cursorColor: ColorResources.appMainColor,
          controller: _activeController,
          enabled: widget.enabled,
          autofocus: widget.autofocus,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
            fontSize: context.responsiveWidth(0.035),
            fontWeight: FontWeight.w400,
            color: ColorResources.text(context),
          ),
          decoration: InputDecoration(
            hintText: widget.hint ?? 'Search...',
            hintStyle: TextStyle(
              fontSize: context.responsiveWidth(0.034),
              fontWeight: FontWeight.w400,
              color: ColorResources.text(context).withAlpha(100),
            ),
            prefixIcon: Icon(
              widget.prefixIcon ?? Iconsax.search_normal,
              size: context.responsiveWidth(0.045),
              color: ColorResources.text(context).withAlpha(120),
            ),
            suffixIcon: _hasText
                ? GestureDetector(
                    onTap: _handleClear,
                    child: Icon(
                      Icons.close_rounded,
                      size: context.responsiveWidth(0.045),
                      color: ColorResources.text(context).withAlpha(140),
                    ),
                  )
                : null,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: context.responsiveHeight(0.015),
            ),
          ),
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
