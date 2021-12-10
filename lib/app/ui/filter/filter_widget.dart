import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;
  final String text;

  const FilterWidget(
      {Key key,
        this.value,
        this.groupValue,
        this.onChanged,
        this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        Text(
          text,
          style: const TextStyle(fontSize: 16.0),
        )
      ],
    );
  }
}
