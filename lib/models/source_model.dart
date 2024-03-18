class SourceData {

  String status;
  String code;
  String message;
  List<SourceModel> sources;

  SourceData(this.status, this.code, this.message, this.sources);
}

class SourceModel {


  final String id;
  final String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.formJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
      );
}
