import 'package:demo/dynamic_form_data.dart';
import 'package:flutter/material.dart';

class CustomDtPicker extends StatefulWidget {
  final DateTime lastDate, firstDate;
  final String hint;

  const CustomDtPicker(
      {super.key,
        required this.lastDate,
        required this.firstDate,
        required this.hint,
      });

  @override
  State<CustomDtPicker> createState() => _CustomDtPickerState();
}

class _CustomDtPickerState extends State<CustomDtPicker> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hint,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        SizedBox(height: 12),
        InkWell(
          onTap: () async {
            DateTime? dateTime = await showDatePicker(
              context: context,
              initialDate: DynamicFormData().initialDate ?? DateTime.now(),
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
            );
            if (dateTime != null) {
              setState(() {
                DynamicFormData().initialDate = dateTime;
              });
            }
          },
          child: TextFormField(
            enabled: false,
            decoration:
            InputDecoration(hintText: DynamicFormData().initialDate!=null ?
            DynamicFormData().initialDate.toString() : "Select", border: OutlineInputBorder(),),
          ),
        ),
      ],
    );
  }
}
