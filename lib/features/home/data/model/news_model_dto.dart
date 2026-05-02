import 'package:news_app/features/home/domain/entities/news_entity.dart';

class NewsModelDto {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModelDto({this.status, this.totalResults, this.articles});

  NewsModelDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  NewsEntity toEntity() => NewsEntity(
    status: status ?? "",
    totalResults: totalResults ?? 0,
    articles: articles?.map((e) => e.toEntity()).toList() ?? [],
  );
}

class Articles {
  String? sourceName;
  String? sourceId;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.sourceName,
    this.sourceId,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    sourceId = json['source']["id"];
    sourceId = json['source']["name"];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  ArticlesEntity toEntity() => ArticlesEntity(
    sourceId: sourceId ?? "",
    sourceName: sourceName ?? "",
    author: author ?? "",
    title: title ?? "",
    description: description ?? "",
    url: url ?? "",
    urlToImage: urlToImage ?? "",
    publishedAt: publishedAt ?? "",
    content: content ?? "",
  );
}
