import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_bloc_state.dart';

class InternetBlocCubit extends Cubit<InternetBlocState> {
  InternetBlocCubit() : super(InternetBlocInitial());
}
