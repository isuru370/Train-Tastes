import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:train_tastes/src/blocs/theme_bloc/theme_bloc.dart';
import 'package:train_tastes/src/routes/navigators.dart';

import '../../../../components/button.widget/oder_btn_widget.dart';
import '../../../../components/product_view_widget.dart';
import '../../../../components/search_bar_widget.dart';
import '../../../../res/app_text.dart/app_text_util.dart';
import '../../../../res/app_theme/colors_util.dart';
import '../../../../res/app_theme/theme_text.dart';
import '../../../../res/image_path/images_utils.dart';
import '../components/header_profile_widget.dart';
import '../components/list_view_builder_widget.dart';
import '../components/top_category_widget.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
          child: Column(
            children: [
              HeaderProfileWidget(
                  onTap: () {
                    var mode =
                        context.read<ThemeBloc>().state == ThemeMode.light;
                    context.read<ThemeBloc>().add(ThemeChanged(isDark: mode));
                  },
                  profileImageUrl: ImagesUtil.userImage,
                  profileName: "Hello Thilan",
                  profileStation: "Meerigama Station"),
              const SizedBox(
                height: 30,
              ),
              SearchBarWidget(
                  onChanged: (p0) {}, hintText: AppTextUtil.searchBarHintText),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppTextUtil.topCategoryText,
                        style: ThemeTextUtil.headerTextNormalBlack,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListViewBuilderWidget(
                        height: 160,
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (p0, p1) {
                          return TopCategoryWidget(
                              onTap: () {},
                              categoryImageUrl: ImagesUtil.categoryImageUrl,
                              categoryName: "Item $p1");
                        },
                      ),
                      Text(
                        AppTextUtil.popularDishesText,
                        style: ThemeTextUtil.headerTextNormalBlack,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListViewBuilderWidget(
                        height: 315,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (p0, p1) {
                          return ProductViewWidget(
                            onTap: () {},
                            favoriteOnTap: () {},
                            productImageUrl: ImagesUtil.foodImg1,
                            productName: "Noodles",
                            productPrice: "1200.00",
                            productSold: "$p1",
                            productDiscount: "15",
                            stationName: "Meerigama Station",
                            icon: Icons.train_sharp,
                            child: AnimatedSwitcher(
                              duration: const Duration(seconds: 1),
                              switchInCurve: Curves.bounceIn,
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                              child: OderButtonWidget(
                                  orderTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed('/singleProductViewScreen');
                                  },
                                  btnText: "Oder Now"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorUtil.tealColor[10],
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed('/cartScreen');
        },
        child: Badge(
            label: const Text("2"),
            child: Icon(
              Iconsax.shopping_cart5,
              color: ColorUtil.whiteColor[10],
            )),
      ),
    );
  }
}
