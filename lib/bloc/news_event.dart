part of 'news_bloc.dart';

@immutable
  sealed class NewsOrgEvent {}


class LoadNewsEvent extends NewsOrgEvent {
    @override
    List<Object?> get props => [];
  }
