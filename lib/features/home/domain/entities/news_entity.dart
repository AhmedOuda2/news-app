class NewsEntity {
  const NewsEntity({
    this.status = "Status",
    this.totalResults = 0,
    this.articles = const [],
  });
  final String status;
  final int totalResults;
  final List<ArticlesEntity> articles;
}

class ArticlesEntity {
  const ArticlesEntity({
    this.sourceName = "Source Name",
    this.sourceId = "Source Id",
    this.author = "Author",
    this.title = "Title",
    this.description = "Description",
    this.url = "Url",
    this.urlToImage = "Url To Image",
    this.publishedAt = "Published At",
    this.content = "Content",
  });
  final String sourceName;
  final String sourceId;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
}
