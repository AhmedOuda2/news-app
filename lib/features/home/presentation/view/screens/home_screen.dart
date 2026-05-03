import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/domain/use_case/get_news_use_case.dart';
import 'package:news_app/features/home/presentation/view/widgets/image_item_widget.dart';
import 'package:news_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:news_app/features/home/presentation/view_model/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = HomeCubit(getNewsUseCaseinjectable());
    _cubit.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        title: Text('News App', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {
          switch (state) {
            case LoadingHomeState():
              return Center(child: CircularProgressIndicator());

            case SccessHomeState():
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ImageItemWidget(
                    image: _cubit.articles[index].urlToImage,
                    title: _cubit.articles[index].title,
                    onTap: () {},
                  );
                },
                itemCount: _cubit.articles.length,
              );
            case ErorrHomeState():
              return Text(
                _cubit.errorMassage,
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: .w300,
                  fontSize: 20,
                ),
              );
          }
        },
      ),
    );
  }
}
