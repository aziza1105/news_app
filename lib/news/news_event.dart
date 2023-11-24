part of 'news_bloc.dart';

sealed class NewsEvent {}
class GetNewsList extends NewsEvent {
  final Function() onSucces;
  final Function(
      String errorMassage
      ) onFailure;
  GetNewsList({
    required this.onSucces,
    required this.onFailure
});
}