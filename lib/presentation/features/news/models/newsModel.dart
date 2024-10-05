// lib/models/article_model.dart
class NewsModel {
  final String title;
  final String author;
  final String content;
  final String image;
  final String tags;

  NewsModel({
    required this.title,
    required this.author,
    required this.content,
    required this.image,
    required this.tags,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['Title'] as String,
      author: json['Author'] as String,
      content: json['Content'] as String,
      image: json['Image'] as String,
      tags: json['Tags'] as String,
    );
  }
}
