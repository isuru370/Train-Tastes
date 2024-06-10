part of 'internet_bloc_cubit.dart';

sealed class InternetBlocState extends Equatable {
  const InternetBlocState();

  @override
  List<Object> get props => [];
}

final class InternetBlocInitial extends InternetBlocState {}
