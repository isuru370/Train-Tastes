import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_tastes/src/modules/landing/category/view/category_index_screen.dart';
import 'package:train_tastes/src/modules/landing/favorite/view/favorite_index_screen.dart';
import 'package:train_tastes/src/modules/landing/profile/view/profile_index_screen.dart';

import '../../../home/view/home_index_screen.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(
          0,
          [
            HomeIndexScreen(),
            CategoryIndexScreen(),
            FavoriteIndexScreen(),
            ProfileIndexScreen(),
          ],
        ));

  void updateIndex(int newIndex) {
    emit(NavigationState(newIndex, state.screens));
  }
}
