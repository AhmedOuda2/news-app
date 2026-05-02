import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/api/home_api.dart';
import 'package:news_app/features/home/data/model/news_model_dto.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/repo/home_data_source/home_data_source.dart';

class HomeRemoteDataSourceImp implements HomeDataSource {
  HomeRemoteDataSourceImp({required this.api});
  final HomeApi api;
  @override
  Future<ResultApi<NewsEntity>> getNews() async {
    var result = await api.getNews();
    switch (result) {
      case SuccessApi<NewsModelDto>():
        return SuccessApi<NewsEntity>(result.data.toEntity());
      case ErorrApi<NewsModelDto>():
        return ErorrApi<NewsEntity>(result.erorr);
    }
  }
}

HomeDataSource homeDataSourceInjectable() =>
    HomeRemoteDataSourceImp(api: HomeApi());
