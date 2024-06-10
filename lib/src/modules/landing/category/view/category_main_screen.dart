import 'package:flutter/material.dart';

class CategoryMainScreen extends StatefulWidget {
  const CategoryMainScreen({super.key});

  @override
  State<CategoryMainScreen> createState() => _CategoryMainScreenState();
}

class _CategoryMainScreenState extends State<CategoryMainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Category Main Page"),
      ),
    );
  }
}
