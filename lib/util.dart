import 'package:demo/constants.dart';
import 'package:demo/form_model.dart';
import 'package:demo/widgets/custom_dt_picker.dart';
import 'package:demo/widgets/drop_down.dart';
import 'package:demo/widgets/edit_text.dart';
import 'package:demo/widgets/radio_group.dart';
import 'package:flutter/material.dart';

double buildWidth(context) => MediaQuery.of(context).size.width;
double buildHeight(context) => MediaQuery.of(context).size.height;

class Util {
  Widget switchWidgets(context, FormResult result) {
    switch (result.type) {
      case Constants.text:
      case Constants.number:
      case Constants.email:
        return EditText(
          keyBoardType: result.type == Constants.text
              ? TextInputType.name
              : result.type == Constants.number
              ? TextInputType.phone
              : result.type == Constants.email
              ? TextInputType.emailAddress
              : null,
          hint: result.hint.toString(),
          required: result.required,
        );
      case Constants.date:
        return CustomDtPicker(
          hint: result.hint.toString(),
          firstDate: DateTime.parse(result.values![0]),
          lastDate: DateTime.now(),
        );
      case Constants.dropDown:
        List<DropdownMenuItem> items = [];
        for (var element in result.values!) {
          items.add(DropdownMenuItem(
            child: Text(element),
          ));
        }
        return CustomDropDown(
          hint: result.hint.toString(),
          items: result.values!,
        );
      case Constants.radio:
        return CustomRadio(
          genderList: result.values ?? [],
          hint: result.hint.toString(),
        );
    }
    return Container();
  }
}