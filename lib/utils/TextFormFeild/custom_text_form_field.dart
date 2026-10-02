import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';
import '../Colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isPasswordField;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextInputType keyboardType;
  final int maxLines;
  final bool expands;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? hintText;
  final bool showBorder;
  final double borderRadius;
  final Color? customFocusedBorderColor;
  final Color? customEnabledBorderColor;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.obscureText = false,
    this.isPasswordField = false,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.expands = false,
    this.readOnly = false,
    this.onTap,
    this.hintText,
    this.showBorder = true,
    this.borderRadius = 14.0,
    this.customFocusedBorderColor,
    this.customEnabledBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: ColorResources.appMainColor,
          selectionColor: ColorResources.appMainColor.withAlpha(80),
          cursorColor: ColorResources.appMainColor,
        ),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        expands: expands,
        readOnly: readOnly,
        onTap: onTap,
        style: _getTextStyle(context),
        cursorColor: ColorResources.appMainColor, // Cursor color fix
        decoration: _buildDecoration(context),
      ),
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: _buildSuffixIcon(context),

      // Label colors fix
      labelStyle: TextStyle(
        fontSize: 13,
        color: ColorResources.text(context).withAlpha(120),
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 14,
        color: ColorResources.appMainColor, // Floating label color
        fontWeight: FontWeight.w500,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: ColorResources.text(context).withAlpha(18),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: ColorResources.text(context).withAlpha(18),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: ColorResources.appMainColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: ColorResources.gradientRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: ColorResources.gradientRed, width: 2.0),
      ),
      fillColor: ColorResources.text(context).withAlpha(7),
      filled: true,

      // Error style
      errorStyle: TextStyle(color: ColorResources.gradientRed, fontSize: 12),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.text(context),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (isPasswordField) {
      return IconButton(
        onPressed: onSuffixIconPressed,
        icon: Icon(
          obscureText ? Iconsax.eye_slash : Iconsax.eye,
          color: ColorResources.text(context).withAlpha(120),
        ),
      );
    } else if (suffixIcon != null) {
      return IconButton(
        onPressed: onSuffixIconPressed,
        icon: Icon(
          suffixIcon,
          color: ColorResources.text(context).withAlpha(120),
        ),
      );
    }
    return null;
  }
}

class CustomDropdownWidget {
  static Widget customDropdown({
    required BuildContext context,
    required String labelText,
    required String? selectedValue,
    required List<String> items,
    required Function(String?) onChanged,
    String? fieldName = 'Field',
    String? hintText,
    bool showBorder = true,
    double borderRadius = 14.0,
    Color? customFocusedBorderColor,
    Color? customEnabledBorderColor,
    bool isSearchable = true,
  }) {
    return _CustomDropdownFormField<String>(
      context: context,
      labelText: labelText,
      selectedValue: selectedValue,
      items: items,
      itemLabels: null,
      onChanged: onChanged,
      fieldName: fieldName,
      hintText: hintText,
      showBorder: showBorder,
      borderRadius: borderRadius,
      customFocusedBorderColor: customFocusedBorderColor,
      customEnabledBorderColor: customEnabledBorderColor,
      isSearchable: isSearchable,
    );
  }

  // Generic dropdown with custom labels (for int IDs with String labels)
  static Widget customDropdownGeneric<T>({
    required BuildContext context,
    required String labelText,
    required T? selectedValue,
    required List<T> items,
    List<String>? itemLabels,
    required Function(T?) onChanged,
    String? fieldName = 'Field',
    String? hintText,
    bool showBorder = true,
    double borderRadius = 14.0,
    Color? customFocusedBorderColor,
    Color? customEnabledBorderColor,
    bool isSearchable = true,
  }) {
    return _CustomDropdownFormField<T>(
      context: context,
      labelText: labelText,
      selectedValue: selectedValue,
      items: items,
      itemLabels: itemLabels,
      onChanged: onChanged,
      fieldName: fieldName,
      hintText: hintText,
      showBorder: showBorder,
      borderRadius: borderRadius,
      customFocusedBorderColor: customFocusedBorderColor,
      customEnabledBorderColor: customEnabledBorderColor,
      isSearchable: isSearchable,
    );
  }
}

class _CustomDropdownFormField<T> extends StatelessWidget {
  final BuildContext context;
  final String labelText;
  final T? selectedValue;
  final List<T> items;
  final List<String>? itemLabels;
  final Function(T?) onChanged;
  final String? fieldName;
  final String? hintText;
  final bool showBorder;
  final double borderRadius;
  final Color? customFocusedBorderColor;
  final Color? customEnabledBorderColor;
  final bool isSearchable;

  const _CustomDropdownFormField({
    Key? key,
    required this.context,
    required this.labelText,
    required this.selectedValue,
    required this.items,
    this.itemLabels,
    required this.onChanged,
    this.fieldName,
    this.hintText,
    this.showBorder = true,
    this.borderRadius = 14.0,
    this.customFocusedBorderColor,
    this.customEnabledBorderColor,
    this.isSearchable = true,
  }) : super(key: key);

  String _getDisplayText(T? value) {
    if (value == null) return '';
    if (itemLabels != null) {
      final index = items.indexOf(value);
      if (index >= 0 && index < itemLabels!.length) {
        return itemLabels![index];
      }
    }
    return value.toString().capitalizeFirst ?? value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasValue = selectedValue != null;
    final displayText = hasValue ? _getDisplayText(selectedValue) : '';

    return GestureDetector(
      onTap: () => _showDropdownBottomSheet(context),
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.text(context).withAlpha(7),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorResources.text(context).withAlpha(18),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    hasValue ? displayText : (hintText ?? labelText),
                    style: TextStyle(
                      fontSize: 13,
                      color: hasValue
                          ? ColorResources.text(context)
                          : ColorResources.text(context).withAlpha(120),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: hasValue
                    ? ColorResources.text(context).withAlpha(100)
                    : ColorResources.text(context).withAlpha(120),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDropdownBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _DropdownBottomSheet<T>(
        title: labelText,
        items: items,
        itemLabels: itemLabels,
        selectedValue: selectedValue,
        onChanged: onChanged,
        isSearchable: isSearchable,
      ),
    );
  }
}

class _DropdownBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final List<String>? itemLabels;
  final T? selectedValue;
  final Function(T?) onChanged;
  final bool isSearchable;

  const _DropdownBottomSheet({
    Key? key,
    required this.title,
    required this.items,
    this.itemLabels,
    required this.selectedValue,
    required this.onChanged,
    required this.isSearchable,
  }) : super(key: key);

  @override
  State<_DropdownBottomSheet<T>> createState() =>
      _DropdownBottomSheetState<T>();
}

class _DropdownBottomSheetState<T> extends State<_DropdownBottomSheet<T>> {
  late List<T> filteredItems;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(_filterItems);
  }

  String _getItemLabel(T item) {
    if (widget.itemLabels != null) {
      final index = widget.items.indexOf(item);
      if (index >= 0 && index < widget.itemLabels!.length) {
        return widget.itemLabels![index];
      }
    }
    return item.toString().capitalizeFirst ?? item.toString();
  }

  void _filterItems() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = widget.items.where((item) {
        final label = _getItemLabel(item).toLowerCase();
        return label.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: ColorResources.card(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorResources.text(context).withAlpha(51),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Select ${widget.title}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorResources.text(context),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: ColorResources.text(context)),
                ),
              ],
            ),
          ),

          // Search Field
          if (widget.isSearchable) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.text(context).withAlpha(10),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorResources.text(context).withAlpha(20),
                  ),
                ),
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: ColorResources.text(context)),
                  decoration: InputDecoration(
                    hintText: 'Search ${widget.title}',
                    hintStyle: TextStyle(
                      color: ColorResources.text(context).withAlpha(100),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorResources.text(context).withAlpha(128),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],

          // Items List
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      'No items found',
                      style: TextStyle(color: ColorResources.text(context)),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final itemLabel = _getItemLabel(item);
                      final isSelected = item == widget.selectedValue;

                      return ListTile(
                        title: Text(
                          itemLabel,
                          style: TextStyle(
                            color: ColorResources.text(context),
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        trailing: isSelected
                            ? Icon(
                                Icons.check,
                                color: ColorResources.appMainColor,
                              )
                            : null,
                        onTap: () {
                          widget.onChanged(item);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CustomTimePickerField extends StatelessWidget {
  final String label;
  final TimeOfDay? selectedTime;
  final VoidCallback onTap;

  const CustomTimePickerField({
    super.key,
    required this.label,
    required this.selectedTime,
    required this.onTap,
  });

  String _formatTime(TimeOfDay? time) {
    if (time == null) return "--:-- --";
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hour:$minute $period";
  }

  static Future<TimeOfDay?> showIOSTimePicker(
    BuildContext context, {
    TimeOfDay? initialTime,
  }) async {
    TimeOfDay selected = initialTime ?? TimeOfDay.now();
    TimeOfDay? result;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _IOSTimePickerSheet(
        initialTime: selected,
        onConfirm: (time) => result = time,
      ),
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mq.size.width * 0.04,
          vertical: mq.size.height * 0.02,
        ),
        decoration: BoxDecoration(
          color: ColorResources.text(context).withAlpha(13),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.clock,
              color: ColorResources.text(context).withAlpha(128),
            ),
            SizedBox(width: mq.size.width * 0.04),
            Expanded(
              child: Text(
                "$label: ${_formatTime(selectedTime)}",
                style: TextStyle(
                  color: selectedTime == null
                      ? ColorResources.text(context).withAlpha(128)
                      : ColorResources.text(context),
                  fontSize: mq.size.width * 0.035,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IOSTimePickerSheet extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onConfirm;

  const _IOSTimePickerSheet({
    required this.initialTime,
    required this.onConfirm,
  });

  @override
  State<_IOSTimePickerSheet> createState() => _IOSTimePickerSheetState();
}

class _IOSTimePickerSheetState extends State<_IOSTimePickerSheet> {
  late int _selectedHour;
  late int _selectedMinute;
  late int _selectedPeriod;

  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _periodController;

  @override
  void initState() {
    super.initState();
    _selectedHour = widget.initialTime.hourOfPeriod == 0
        ? 12
        : widget.initialTime.hourOfPeriod;
    _selectedMinute = widget.initialTime.minute;
    _selectedPeriod = widget.initialTime.period == DayPeriod.am ? 0 : 1;

    _hourController = FixedExtentScrollController(
      initialItem: _selectedHour - 1,
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _selectedMinute,
    );
    _periodController = FixedExtentScrollController(
      initialItem: _selectedPeriod,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  TimeOfDay get _result {
    int hour = _selectedHour % 12;
    if (_selectedPeriod == 1) hour += 12;
    return TimeOfDay(hour: hour, minute: _selectedMinute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.card(context),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(51),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title + buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: ColorResources.text(context),
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Select Time',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: ColorResources.text(context),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onConfirm(_result);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: ColorResources.appMainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.black.withAlpha(26)),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Selection highlight
                Center(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: ColorResources.appMainColor.withAlpha(20),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Row(
                  children: [
                    // Hours
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: _hourController,
                        itemExtent: 40,
                        perspective: 0.003,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (i) =>
                            setState(() => _selectedHour = i + 1),
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, i) => Center(
                            child: Text(
                              '${i + 1}'.padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: _selectedHour == i + 1
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: _selectedHour == i + 1
                                    ? ColorResources.text(context)
                                    : ColorResources.text(
                                        context,
                                      ).withAlpha(128),
                              ),
                            ),
                          ),
                          childCount: 12,
                        ),
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: ColorResources.text(context),
                      ),
                    ),
                    // Minutes
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        controller: _minuteController,
                        itemExtent: 40,
                        perspective: 0.003,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (i) =>
                            setState(() => _selectedMinute = i),
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, i) => Center(
                            child: Text(
                              '$i'.padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: _selectedMinute == i
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: _selectedMinute == i
                                    ? ColorResources.text(context)
                                    : ColorResources.text(
                                        context,
                                      ).withAlpha(128),
                              ),
                            ),
                          ),
                          childCount: 60,
                        ),
                      ),
                    ),
                    // AM/PM
                    Expanded(
                      child: ListWheelScrollView(
                        controller: _periodController,
                        itemExtent: 40,
                        perspective: 0.003,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (i) =>
                            setState(() => _selectedPeriod = i),
                        children: ['AM', 'PM']
                            .asMap()
                            .entries
                            .map(
                              (e) => Center(
                                child: Text(
                                  e.value,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: _selectedPeriod == e.key
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: _selectedPeriod == e.key
                                        ? ColorResources.text(context)
                                        : ColorResources.text(
                                            context,
                                          ).withAlpha(128),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
