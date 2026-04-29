import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/network/result_api.dart';
import 'package:news_app/features/home/data/model/news_model.dart';
import 'package:news_app/features/home/data/repo/repository_data_source/home_repository.dart';
import 'package:news_app/features/home/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(LoadingHomeState());
  HomeRepository repo;
  List<Articles> articles = [];
  String errorMassage = "";

  Future<void> getNews() async {
    emit(LoadingHomeState());
    final result = await repo.getHomeData();
    switch (result) {
      case SuccessApi<NewsModel>():
        articles = result.data.articles ?? [];
        emit(SccessHomeState());
      case ErorrApi<NewsModel>():
        errorMassage = result.erorr;
        emit(ErorrHomeState());
    }
  }
}
