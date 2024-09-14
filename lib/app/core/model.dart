class DataModel {
  String? id;
  String title;
  String details;

  DataModel({
    this.id,
    required this.title,
    required this.details,
  });

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      title: map['title'],
      details: map['details'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'details': details,
    };
  }
}
