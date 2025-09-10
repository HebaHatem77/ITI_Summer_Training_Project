class ContentModel {
  final String title;
  final String description;

  ContentModel({
    required this.title,
    required this.description,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
    );
  }
}

