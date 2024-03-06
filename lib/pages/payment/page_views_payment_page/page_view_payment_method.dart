import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/payment/models/payment_viewable_model.dart';
import 'package:motorparts_marketplace/widgets/card_container.dart';

class PageViewPaymentMethod extends StatefulWidget {
  const PageViewPaymentMethod({super.key});

  @override
  State<PageViewPaymentMethod> createState() => _PageViewPaymentMethodState();
}

class _PageViewPaymentMethodState extends State<PageViewPaymentMethod> {
  static final List<PaymentMethodViewable> paymentMethods = [
    PaymentMethodViewable(
      paymentMethod: 'Visa',
      paymentMethodNumber: '**** **** **** 1234',
      paymentMethodExpireDate: '12/24',
    ),
    PaymentMethodViewable(
      paymentMethod: 'Visa',
      paymentMethodNumber: '**** **** **** 1234',
      paymentMethodExpireDate: '12/24',
    ),
    PaymentMethodViewable(
      paymentMethod: 'Visa',
      paymentMethodNumber: '**** **** **** 1234',
      paymentMethodExpireDate: '12/24',
    ),
  ];

  int paymentMethodIndexChosen = 0;

  /// Function to change the chosen payment method
  /// [index] is the index of the payment method
  /// [isChosen] is the boolean value of the payment method
  /// [changePaymentMethodIndexChosen] is the function to change the payment method

  void changePaymentMethodIndexChosen(int index) {
    setState(() {
      paymentMethodIndexChosen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < paymentMethods.length; i++)
                    CardPaymentMethod(
                      paymentMethod: paymentMethods[i].paymentMethod,
                      paymentMethodNumber:
                          paymentMethods[i].paymentMethodNumber,
                      paymentMethodExpireDate:
                          paymentMethods[i].paymentMethodExpireDate,
                      isChosen: i == paymentMethodIndexChosen,
                      changePaymentMethodIndexChosen: () {
                        changePaymentMethodIndexChosen(i);
                      },
                    ),
                ],
              ),
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
