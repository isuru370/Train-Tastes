import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../components/app_heder_text_widget.dart';
import '../../../../components/button.widget/oder_btn_widget.dart';
import '../../../../components/card_widget.dart';
import '../../../../components/product_view_widget.dart';
import '../../../../components/round_container_widget.dart';
import '../../../../res/app_theme/colors_util.dart';
import '../../../../res/image_path/images_utils.dart';
import '../../../landing/home/components/list_view_builder_widget.dart';
import '../bloc/indicator/indicator_cubit.dart';
import '../bloc/quantity_update/quantity_cubit.dart';
import '../bloc/quantity_update/quantity_state.dart';
import '../bloc/toggle_button/toggle_button_cubit.dart';
import '../components/backdrop_filter_widget.dart';
import '../components/draggable_scrollable_sheet_widget.dart';
import '../components/image_slider.dart';
import '../components/product_image_widget.dart';
import '../components/review_contend_widget.dart';

class SingleProductViewScreen extends StatefulWidget {
  const SingleProductViewScreen({super.key});

  @override
  State<SingleProductViewScreen> createState() =>
      _SingleProductViewScreenState();
}

class _SingleProductViewScreenState extends State<SingleProductViewScreen> {
  int minQuantity = 1;
  bool visibleContainer = false;
  static const List<String> sampleImages = [
    'https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bm9vZGxlc3xlbnwwfHwwfHx8MA%3D%3D',
    'https://yufoodlabs.com/cdn/shop/products/2_0df21a50-546a-4202-859f-a19cf53e6123_800x.jpg?v=1668075168',
    'https://i.pinimg.com/474x/d7/eb/39/d7eb39251ceabc69ce1bc45dd2d045cf.jpg',
    'https://production-media.gousto.co.uk/cms/mood-image/2047---Spicy-Peanut-Chicken-Noodles0227-1616494881154.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final quantityCubit = BlocProvider.of<QuantityCubit>(context);
    final dotIndicatorCubit = BlocProvider.of<DotIndicatorCubit>(context);
    final toggleButtonProvider = BlocProvider.of<ToggleButtonCubit>(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ImageSliderWidget(
                onPageChanged: (p0, p1) {
                  dotIndicatorCubit.updateImageIndex(p0);
                },
                items: sampleImages.map((e) {
                  return Builder(
                    builder: (context) {
                      return ProductImageWidget(productImage: e);
                    },
                  );
                }).toList()),
          ),
          dotIndicator(context, dotIndicatorCubit),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const BackdropFilterWidget(
                        icon: Icons.arrow_back_ios, size: 20)),
                const BackdropFilterWidget(icon: Iconsax.heart, size: 30),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.48,
            maxChildSize: 1,
            minChildSize: 0.48,
            builder: (context, scrollController) {
              return DraggableScrollableSheetWidget(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 25),
                        child: DecorationWidget(),
                      ),
                      const ShopNameWidget(
                          shopNameText: "Meerigama Isuru Foodi"),
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderNameWidget(
                          productName: "Noodles", rate: 4.5, ratingNo: "4.5"),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBarWidget(
                            textBarName: "1456 Sold",
                            color: ColorUtil.tealColor[10]!,
                          ),
                          TextBarWidget(
                              textBarName: "5% off",
                              color: ColorUtil.orangeColor[10]!),
                          TextBarWidget(
                            textBarName: "100% Natural",
                            color: ColorUtil.greenColor[10]!,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppHeaderTextWidget(headerText: "Description"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppHeaderTextWidget(headerText: "Reviews"),
                          ListViewBuilderWidget(
                            height: 200,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (p0, p1) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    CardWidget(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: SizedBox(),
                                        color: ColorUtil.whiteColor[12]!),
                                    ReviewContendWidget(
                                      userImageUrl: ImagesUtil.userProfileImage,
                                      userName: "Thilan Wijenayaka",
                                      dateTime: "24-05-29 6.30 AM",
                                      description:
                                          "Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy text of the printing and type sed setting industry.  Lorem Ipsum is simply dummy ",
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          toggleButtonProvider
                              .foodShopVisible(visibleContainer);
                        },
                        child: CardWidget(
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          color: ColorUtil.tealColor[10]!,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Please Select Your Pic Up Station And The Relevant Food Shop",
                                style: TextStyle(
                                    color: ColorUtil.whiteColor[10],
                                    letterSpacing: 1),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
                                  builder: (context, state) {
                                return Icon(
                                  visibleContainer
                                      ? Iconsax.arrow_circle_up4
                                      : Iconsax.arrow_circle_down5,
                                  color: ColorUtil.whiteColor[10],
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
                          builder: (context, state) {
                        if (state is FoodShopVisibleState) {
                          visibleContainer = state.isFoodShop;
                        }
                        return visibleContainer
                            ? shopViewMethod()
                            : const SizedBox();
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      categoryProductViewMethod(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    RoundContainerWidget(
                        onTap: () {
                          quantityCubit.decreaseQuantity(minQuantity, 80, 10);
                        },
                        width: 30,
                        height: 30,
                        icon: Iconsax.minus),
                    const SizedBox(
                      width: 10,
                    ),
                    BlocBuilder<QuantityCubit, QuantityState>(
                        builder: (context, state) {
                      if (state is QuantityUpdatedState) {
                        minQuantity = state.quantity;
                      }
                      return AppHeaderTextWidget(
                          headerText:
                              "${state is QuantityUpdatedState ? state.quantity : minQuantity}");
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    RoundContainerWidget(
                        onTap: () {
                          quantityCubit.increaseQuantity(minQuantity, 80, 10);
                        },
                        width: 30,
                        height: 30,
                        icon: Iconsax.add),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CardWidget(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        color: ColorUtil.tealColor[10]!,
                        child: Column(
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorUtil.whiteColor[10],
                                  fontWeight: FontWeight.w600),
                            ),
                            BlocBuilder<QuantityCubit, QuantityState>(
                                builder: (context, state) {
                              return Text(
                                "${state is QuantityUpdatedState ? state.price : "80.00"} LKR",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorUtil.whiteColor[16],
                                    fontWeight: FontWeight.w600),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dotIndicator(BuildContext context, DotIndicatorCubit dotIndicatorCubit) {
    int index = 0;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < sampleImages.length; i++)
            BlocBuilder<DotIndicatorCubit, DotIndicatorState>(
                builder: (context, state) {
              if (state is DotIndicatorUpdateState) {
                index = state.index;
              }
              return Container(
                margin: const EdgeInsets.all(5),
                height: i == index ? 12 : 13,
                width: i == index ? 12 : 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == index
                      ? ColorUtil.tealColor[10]
                      : ColorUtil.whiteColor[14],
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget shopViewMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: AppHeaderTextWidget(headerText: "Shop"),
        ),
        ListViewBuilderWidget(
          height: 200,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (p0, p1) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                alignment: const Alignment(1, 0.9),
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2021/05/27/18/55/woman-6289052_1280.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            color: ColorUtil.whiteColor[10],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          "Meerigama Isuru Foodi",
                          style: TextStyle(
                              color: ColorUtil.tealColor[10],
                              fontWeight: FontWeight.w800),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget categoryProductViewMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppHeaderTextWidget(headerText: "Fore More"),
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
              child: OderButtonWidget(
                  orderTap: () {
                    Navigator.pushNamed(context, "/singleProductScreen");
                    print("object");
                  },
                  btnText: "Oder Now"),
            );
          },
        ),
      ],
    );
  }
}
