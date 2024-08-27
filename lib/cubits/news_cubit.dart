// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:untitled2/consts.dart';
// import 'package:untitled2/models/Article.dart';
// import 'package:untitled2/services/news_services.dart';
//
// part 'news_state.dart';
//
// class NewsCubit extends Cubit<NewsState> {
//   NewsCubit() : super(NewsInitial());
//
//   get_news() async {
//     emit(newsLoading());
//     try{
//       List<Article> articles = await NewsServices().get_data(
//           path: Consts().ORGURL + Consts().Endpoints,
//           query: {"apikey":Consts().APIKey , "q" : 'bitcoin'});
//       emit(newsSuccesful(articleList: articles));
//
//     }
//     catch(e){
//       emit(newsfailed(error: e.toString()));
//     }
//   }
// }
