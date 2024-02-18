import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:miniproject2/models/news_model.dart';
import 'package:miniproject2/services/news_services.dart';
import 'package:miniproject2/services/news_services2.dart';


part 'news_event.dart';
part 'news_state.dart';

class NewsOrgBloc extends Bloc<NewsOrgEvent, NewsOrgState> {
  final NewsServices _newsServices;

  NewsOrgBloc(this._newsServices) : super(NewsOrgInitial()){
    on<LoadNewsEvent> ((event,emit) async {
      emit (NewsLoadingState());
      try {
        final news = await _newsServices.getNews();
        emit(NewsLoadedState(news));
      }catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    }
    );
  }
}

class NewsOrgBloc2 extends Bloc<NewsOrgEvent, NewsOrgState> {
  final NewsServices2 _newsServices2;

  NewsOrgBloc2(this._newsServices2) : super(NewsOrgInitial()){
    on<LoadNewsEvent> ((event,emit) async {
      emit (NewsLoadingState());
      try {
        final news = await _newsServices2.getNews();
        emit(NewsLoadedState(news));
      }catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    }
    );
  }
}