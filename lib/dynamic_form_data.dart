class DynamicFormData {
  static final DynamicFormData formData = DynamicFormData.internal();

  List<List> result = [];
  DateTime? initialDate;
  String? dropDownValue;
  int? genderValue;

  factory DynamicFormData() => formData;
  DynamicFormData.internal();
}