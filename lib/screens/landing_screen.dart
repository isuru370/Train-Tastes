import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/screen_index_provider/screen_index_provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<dynamic> screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    final _screenIndexProvider = Provider.of<ScreenIndexProvider>(context);
    int currentScreenIndex = _screenIndexProvider.fetchCurrentIndex;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        
        showSelectedLabels: false,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        onTap: (value) => _screenIndexProvider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                  (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined),
              backgroundColor: Colors
                  .indigo // provide color to any one icon as it will overwrite the whole bottombar's color ( if provided any )
              ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon((currentScreenIndex == 1)
                ? Icons.search
                : Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon((currentScreenIndex == 2)
                ? Icons.favorite
                : Icons.favorite_outline),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon((currentScreenIndex == 3)
                ? Icons.person
                : Icons.person_outline),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
