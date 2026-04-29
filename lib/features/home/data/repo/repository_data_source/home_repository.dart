import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/model/news_model.dart';

abstract interface class HomeRepository {
  Future<ResultApi<NewsModel>> getHomeData();
}
