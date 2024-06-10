import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:train_tastes/src/modules/landing/bottom_navigation/components/bottom_nav_widget.dart';
import 'package:train_tastes/src/routes/navigators.dart';

import '../../../../res/app_theme/colors_util.dart';
import '../block/bottom_navigation_cubit/navigation_cubit.dart';
import '../block/bottom_navigation_cubit/navigation_state.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          currentIndex = state.index;
          print(currentIndex);
          return BottomNavWidget(
            bottomNavigatorKey: bottomNavigatorKey,
            onTap: (bottomIndex) {
              context.read<NavigationCubit>().updateIndex(bottomIndex);
            },
            currentIndex: currentIndex,
            bottomNavItems: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  (currentIndex == 0) ? Iconsax.home5 : Iconsax.home,
                  color: ColorUtil.tealColor[10],
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Category',
                icon: Icon(
                    (currentIndex == 1) ? Iconsax.category5 : Iconsax.category,
                    color: ColorUtil.tealColor[10],
                    size: 30),
              ),
              BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon((currentIndex == 2) ? Iconsax.heart5 : Iconsax.heart,
                    color: ColorUtil.tealColor[10], size: 30),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                    (currentIndex == 3)
                        ? Iconsax.profile_circle5
                        : Iconsax.profile_circle,
                    color: ColorUtil.tealColor[10],
                    size: 30),
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            switchInCurve: Curves.bounceInOut,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: state.screens[state.index],
          );
        },
      ),
    );
  }
}
