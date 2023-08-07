import 'package:demo/dynamic_form_data.dart';
import 'package:demo/util.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final List genderList;
  final String hint;

  const CustomRadio({super.key, required this.genderList, required this.hint});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8,),
        Text(
          widget.hint,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Container(
          height: buildHeight(context) * 0.25,
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: List.generate(
              widget.genderList.length,
              (index) => RadioListTile(
                value: index,
                contentPadding: EdgeInsets.zero,
                title: Text(widget.genderList[index]),
                groupValue: DynamicFormData().genderValue,
                onChanged: (value) {
                  setState(() {
                    DynamicFormData().genderValue = value;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
