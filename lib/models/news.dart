import 'package:news_app/models/article.dart';

class NewsModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
});
}