import 'package:flutter/cupertino.dart';
import 'package:motorparts_marketplace/pages/ir_al_catalogo_page/ir_al_catalogo_page.dart';
import 'package:motorparts_marketplace/pages/payment/payment_page.dart';

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
            CardContainer(
              child: Container(
                height: 50,
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Text('Add new Payment Method'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
