part of 'news_bloc.dart';

@immutable
  sealed class NewsOrgState {}

  final class NewsOrgInitial extends NewsOrgState {}

  class NewsLoadingState extends NewsOrgState {
    @override
    List<Object> get props => [];
  }

class NewsLoadedState extends NewsOrgState {
  final List<NewsOrgModel> news;
  NewsLoadedState(this.news);
  @override
  List<Object> get props => [];
}

class NewsErrorState extends NewsOrgState {
  final String error;
  NewsErrorState(this.error);

  @override
  List<Object> get props => [];
}