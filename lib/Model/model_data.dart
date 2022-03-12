class JsonData {
  JsonData({
    required this.title,
    required this.rows,
  });
  String? title;
  List<Rows>? rows;

  factory JsonData.fromJson(Map<String, dynamic> json) {
    final title = json['title'] == null ? null : json["title"];
    final rowsData = json['rows'] as List<dynamic>?;
    final rows = rowsData != null
        ? rowsData.map((rowsData) => Rows.fromJson(rowsData)).toList()
        : <Rows>[];
    return JsonData(rows: rows, title: title);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['rows'] = rows?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Rows {
  Rows({
    required this.title,
    required this.description,
    required this.imageHref,
  });
  String? title;
  String? description;
  String? imageHref;

  factory Rows.fromJson(Map<String, dynamic> json) {
    final title = json['title'] == null ? null : json["title"];
    final description =
        json['description'] == null ? null : json["description"];
    final imageHref = json['imageHref'] == null ? null : json["imageHref"];
    return Rows(title: title, description: description, imageHref: imageHref);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['imageHref'] = imageHref;
    return _data;
  }
}
