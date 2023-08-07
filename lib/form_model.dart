class FormModel {
  List<List>? result;

  FormModel({this.result});

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
      result: List.from(json["data"]
          .map((x) => List.from(x.map((y) =>
          FormResult.fromJson(y))))));
}

class FormResult {
  int? id;
  String? type;
  String? hint;
  bool? required;
  List? values;
  int? page;

  FormResult(
      {this.id, this.type, this.hint, this.required, this.values, this.page});

  factory FormResult.fromJson(Map<String, dynamic> json) => FormResult(
      id: json["id"],
      type: json["type"],
      hint: json["hint"],
      required: json["required"],
      values: json["values"],
      page: json["page"]);
}
