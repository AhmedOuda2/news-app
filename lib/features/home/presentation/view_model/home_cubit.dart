import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/domain/entities/news_entity.dart';
import 'package:news_app/features/home/domain/use_case/get_news_use_case.dart';
import 'package:news_app/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(LoadingHomeState());
  GetNewsUseCase repo;
  List<ArticlesEntity> articles = [];
  String errorMassage = "";

  Future<void> getNews() async {
    emit(LoadingHomeState());
    final result = await repo.invoke();
    switch (result) {
      case SuccessApi<NewsEntity>():
        articles = result.data.articles;
        emit(SccessHomeState());
      case ErorrApi<NewsEntity>():
        errorMassage = result.erorr;
        emit(ErorrHomeState());
    }
  }
}
