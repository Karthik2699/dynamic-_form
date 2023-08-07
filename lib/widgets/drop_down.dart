import 'package:demo/dynamic_form_data.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String hint;
  final List items;
  const CustomDropDown({super.key, required this.hint,
    required this.items});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton<String>(
        underline: Container(),
        isExpanded: true,
        value: DynamicFormData().dropDownValue,
        hint: Text(widget.hint),
        items: widget.items.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            DynamicFormData().dropDownValue = value;
          });
        },
      ),
    );
  }
}