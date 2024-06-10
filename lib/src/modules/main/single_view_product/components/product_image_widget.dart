import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final String productImage;
  const ProductImageWidget({super.key, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(productImage), fit: BoxFit.cover)),
    );
  }
}
