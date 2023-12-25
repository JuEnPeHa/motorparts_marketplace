import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/ir_al_catalogo_page/ir_al_catalogo_page.dart';
import 'package:motorparts_marketplace/pages/payment/page_views_payment_page/page_view_order_summary.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int pageViewIndex = 2;
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
              PaymentHeader(pageViewIndex: 2),
              Expanded(
                child: PageView(
                  controller: pageController,
                  // onPageChanged: (int index) {
                  //   setState(() {
                  //     pageViewIndex = index;
                  //   });
                  // },
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
              PaymentFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  const CardAddress({
    super.key,
    required this.address,
    required this.addressName,
    required this.addressPhone,
    required this.isChosen,
    required this.changeAddressIndexChosen,
  });

  final String address;
  final String addressName;
  final String addressPhone;
  final bool isChosen;
  final Function changeAddressIndexChosen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeAddressIndexChosen();
      },
      child: CardContainer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: isChosen,
                    groupValue: true,
                    onChanged: (bool? value) {},
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(address),
                      Text(addressPhone),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardPaymentMethod extends StatelessWidget {
  const CardPaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.paymentMethodNumber,
    required this.paymentMethodExpireDate,
    required this.isChosen,
    required this.changePaymentMethodIndexChosen,
  });

  final String paymentMethod;
  final String paymentMethodNumber;
  final String paymentMethodExpireDate;
  final bool isChosen;
  final Function changePaymentMethodIndexChosen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changePaymentMethodIndexChosen();
      },
      child: CardContainer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: isChosen,
                    groupValue: true,
                    onChanged: (bool? value) {},
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paymentMethod,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(paymentMethodNumber),
                      Text(paymentMethodExpireDate),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ],
            ),
          ],
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
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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

class Address {
  final String address;
  final String addressName;
  final String addressPhone;

  Address({
    required this.address,
    required this.addressName,
    required this.addressPhone,
  });
}

class PaymentMethodViewable {
  final String paymentMethod;
  final String paymentMethodNumber;
  final String paymentMethodExpireDate;

  PaymentMethodViewable({
    required this.paymentMethod,
    required this.paymentMethodNumber,
    required this.paymentMethodExpireDate,
  });
}

class Product {
  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productImageBase64;

  Product({
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productImageBase64,
  });
}
