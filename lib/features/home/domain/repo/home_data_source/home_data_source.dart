import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';

abstract interface class HomeDataSource {
  Future<ResultApi<NewsEntity>> getNews();
}
