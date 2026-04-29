import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/model/news_model.dart';
import 'package:news_app/features/home/data/repo/data_source/home_data_source.dart';
import 'package:news_app/features/home/data/repo/repository_data_source/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp(this.repo);
  HomeDataSource repo;
  @override
  Future<ResultApi<NewsModel>> getHomeData() {
    return repo.getHomeData();
  }
}
