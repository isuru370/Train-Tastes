import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_tastes/providers/them_provider/theme.provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  themeProvider.toggleTheme();
                },
                child: Text("data"))
          ],
        ));
  }
}
