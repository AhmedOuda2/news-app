import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/repo/repository_data_source/home_repository_imp.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/repo/repository/home_repository.dart';

class GetNewsUseCase {
  GetNewsUseCase(this._repository);
  final HomeRepository _repository;

  Future<ResultApi<NewsEntity>> invoke() => _removeNullImage();
  Future<ResultApi<NewsEntity>> _removeNullImage() async {
    var result = await _repository.getNews();
    switch (result) {
      case SuccessApi<NewsEntity>():
        result.data.articles.removeWhere(
          (element) => element.urlToImage == "Url To Image",
        );
        return SuccessApi<NewsEntity>(result.data);
      case ErorrApi<NewsEntity>():
        return ErorrApi<NewsEntity>(result.erorr);
    }
  }
}

GetNewsUseCase getNewsUseCaseinjectable() =>
    GetNewsUseCase(homeRepositoryInjectable());
