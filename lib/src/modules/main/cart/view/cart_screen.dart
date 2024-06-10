import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../components/round_container_widget.dart';
import '../../../../res/app_theme/colors_util.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 0.63,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorUtil.whiteColor[10],
                      boxShadow: [
                        BoxShadow(
                          color: ColorUtil.whiteColor[16]!,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.red,
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "product Nameh dksl dfjkl sdfjskl",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Shop Name hdskjgd fsgdfskd fsgdfkd ",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("130.00 LKR"),
                                Row(
                                  children: [
                                    RoundContainerWidget(
                                        onTap: () {},
                                        width: 20,
                                        height: 20,
                                        icon: Iconsax.minus),
                                    Text("5"),
                                    RoundContainerWidget(
                                        onTap: () {},
                                        width: 20,
                                        height: 20,
                                        icon: Iconsax.add),
                                  ],
                                ),
                              ],
                            ),
                            Checkbox(
                              value: true,
                              activeColor: Colors.red,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
