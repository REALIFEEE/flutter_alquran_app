part of 'surah_cubit.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<SurahModel> listsurah;

  const SurahLoaded({required this.listsurah});

  @override
  List<Object> get props => [listsurah];
}

class SurahError extends SurahState {
  final String message;

  const SurahError({required this.message});

  @override
  List<Object> get props => [message];
}
