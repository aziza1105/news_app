import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/status.dart';

part 'news_state.dart';
part 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc()
      : super(
    const NewsState(
      status: LoadingStatus.pure,
      news: [],
    ),
  ) {
    on<GetNewsList>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      try {
        await Future.delayed(const Duration(seconds: 4));

        final newsList = [
          NewsModel(
            status: "ok",
            totalResults: 35,
            articles: [
              ArticleModel(
                author: "Javier Fernandez-Marques",
                title:
                "Federated Finetuning of OpenAI's Whisper on Raspberry Pi 5",
                description:
                "Check out the new code example federating OpenAI's Whisper for the downstream task of keyword spotting.",
                urlToImage:
                "https://flower.dev/static/images/previews/1200x628/2023-11-15-federated-finetuning-of-openai-whisper-with-flower.jpg",
                publishedAt: "2023-11-16T19:30:41Z",
                content:
                "Federated Learning has come a long way since it was formalised by McMahan et al. 2017. Gone are the days where it was reduced to MNIST-level training or equivalent toy examples with small ML models. … [+3444 chars]",
              ),
            ],
          ),
        ];

        emit(state.copyWith(
          status: LoadingStatus.loadedWithSuccess,
          news: newsList,
        ));
      } catch (e) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
      }
    });
  }
}