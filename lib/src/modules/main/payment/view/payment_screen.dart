import 'package:flutter/material.dart';
import 'package:train_tastes/src/components/card_widget.dart';
import 'package:train_tastes/src/modules/main/payment/components/payment_bottom_sheet_widget.dart';
import 'package:train_tastes/src/res/app_theme/colors_util.dart';
import 'package:train_tastes/src/res/image_path/images_utils.dart';

import '../../../../components/button.widget/main_btn_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool paymentMethod = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardWidget(
                padding: const EdgeInsets.only(left: 20, right: 6),
                color: ColorUtil.whiteColor[10]!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(ImagesUtil.googlePayIcon),
                    ),
                    Text("Google Pay"),
                    Radio(
                      activeColor: ColorUtil.tealColor[10],
                      fillColor: WidgetStatePropertyAll<Color>(
                          ColorUtil.tealColor[10]!),
                      value: true,
                      groupValue: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: PaymentBottomSheetWidget(
        height: MediaQuery.of(context).size.height * 0.3,
        subTotal: 120,
        deliveryCharge: 0,
        totalPrice: 120,
        child: MainBtnWidget(
          width: MediaQuery.of(context).size.width / 0.8,
          btnBackgroundColor: ColorUtil.tealColor[10],
          textColor: ColorUtil.whiteColor[10],
          buttonText: 'Buy Now',
          onTap: () {},
        ),
      ),
    );
  }
}
