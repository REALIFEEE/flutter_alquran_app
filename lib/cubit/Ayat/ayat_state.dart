part of 'ayat_cubit.dart';

abstract class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

class AyatInitial extends AyatState {}

class ayatLoading extends AyatState {}

class AyatLoaded extends AyatState {
  final SurahDetailModel detail;

  AyatLoaded({required this.detail});

  @override
  // TODO: implement props
  List<Object> get props => [detail];
}

class AyatError extends AyatState {
  final String message;

  AyatError({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
