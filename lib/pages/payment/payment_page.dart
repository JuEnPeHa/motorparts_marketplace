import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/payment/page_views_payment_page/page_view_address_method.dart';
import 'package:motorparts_marketplace/pages/payment/page_views_payment_page/page_view_order_summary.dart';
import 'package:motorparts_marketplace/pages/payment/page_views_payment_page/page_view_payment_method.dart';
import 'package:motorparts_marketplace/pages/payment/widgets/header_and_footer_widget.dart';
import 'package:motorparts_marketplace/pages/payment/widgets/add_new_and_select_button.dart';
import 'package:motorparts_marketplace/widgets/card_container.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int pageViewIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: pageViewIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        child: SafeArea(
          child: Column(
            children: [
              PaymentHeader(pageViewIndex: pageViewIndex),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      pageViewIndex = index;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  scrollBehavior: const MaterialScrollBehavior().copyWith(
                    scrollbars: false,
                  ),
                  children: [
                    PageViewPaymentMethod(),
                    PageViewAddressMethod(),
                    PageViewOrderSummary(),
                    // PaymentMethodsPage(),
                    // AddressDetailsPage(),
                    // OrderSummaryPage(),
                  ],
                ),
              ),
              AddNewAndSelectButton(
                actualPageViewIndex: pageViewIndex,
                lengthOfAddressesOrPaymentMethods: 3, // addresses?.length ?? 0,
                onPressedAddNewButton: () {
                  if (pageViewIndex == 0) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AddNewCardPage(),
                    //   ),
                    // );
                  } else if (pageViewIndex == 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AddNewAddressPage(),
                    //   ),
                    // );
                  }
                },
                onPressedSelectButton: () {
                  // for now just navigate to next pageview
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  if (pageViewIndex == 0) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SelectCardPage(),
                    //   ),
                    // );
                  } else if (pageViewIndex == 1) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SelectAddressPage(),
                    //   ),
                    // );
                  }
                },
              ),
              pageViewIndex == 2
                  ? const SizedBox.shrink()
                  : const PaymentFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardOrderSummaryProduct extends StatelessWidget {
  const CardOrderSummaryProduct({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productImageBase64,
  });

  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productImageBase64;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.memory(
              base64Decode(productImageBase64),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(productPrice),
                Text(productQuantity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardOrderSummaryPaymentAndAddress extends StatelessWidget {
  const CardOrderSummaryPaymentAndAddress({
    super.key,
    required this.address,
    required this.addressName,
    required this.addressPhone,
    required this.paymentMethod,
    required this.paymentMethodNumber,
    required this.paymentMethodExpireDate,
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.total,
  });

  final String address;
  final String addressName;
  final String addressPhone;
  final String paymentMethod;
  final String paymentMethodNumber;
  final String paymentMethodExpireDate;

  final String subtotal;
  final String shipping;
  final String discount;
  final String total;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(address),
                    Text(addressName),
                    Text(addressPhone),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Payment Method',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(paymentMethod),
                    Text(paymentMethodNumber),
                    Text(paymentMethodExpireDate),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            // angle: 90 * 3.14 / 180,
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Shipping',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Discount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(subtotal.toString()),
                    Text(shipping.toString()),
                    Text(discount.toString()),
                    Text(total.toString()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
