import 'package:flutter/material.dart';
import 'package:home_plate/Constants/constants.dart';

class CustomCheckboxWidget extends StatelessWidget {
  const CustomCheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final Function(bool? p0)? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: const CheckboxThemeData(
          fillColor: MaterialStatePropertyAll<Color?>(
            Colors.transparent,
          ),
          checkColor: MaterialStatePropertyAll<Color?>(
            Colors.white,
          ),
        ),
      ),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Constants.fourthColor,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
class CustomCheckboxListTile extends StatelessWidget {
  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.titleStyle,
  });
  final String title;
  final bool value;
  final TextStyle? titleStyle;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      leading: CustomCheckboxWidget(
        onChanged: onChanged,
        value: value,
      ),
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Constants.fourthColor),
      ),
    );
  }
}