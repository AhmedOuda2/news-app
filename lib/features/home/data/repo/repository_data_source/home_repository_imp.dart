import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/repo/data_source/home_remote_data_source_imp.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_data_source/home_data_source.dart';
import 'package:news_app/features/home/domain/repo/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp(this.dataSource);
  HomeDataSource dataSource;

  @override
  Future<ResultApi<NewsEntity>> getNews() async {
    var result = await dataSource.getNews();
    switch (result) {
      case SuccessApi<NewsEntity>():
        return SuccessApi<NewsEntity>(result.data);
      case ErorrApi<NewsEntity>():
        return ErorrApi<NewsEntity>(result.erorr);
    }
  }
}

HomeRepository homeRepositoryInjectable() =>
    HomeRepositoryImp(homeDataSourceInjectable());
