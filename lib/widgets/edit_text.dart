import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final TextInputType? keyBoardType;
  final String hint;
  final bool? required;

  const EditText(
      {super.key, this.keyBoardType, required this.hint, this.required});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyBoardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(labelText: hint),
        validator: (value) {
          if (required == true) {
            if (value!.isEmpty) {
              return "Field is required";
            }
          }
          return null;
        }
        );
  }
}
