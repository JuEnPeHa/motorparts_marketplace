import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/payment/payment_page.dart';

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
    return SafeArea(
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
                // PaymentMethodsPage(),
                // AddressDetailsPage(),
                // OrderSummaryPage(),
              ],
            ),
          ),
          PaymentFooter(),
        ],
      ),
    );
  }
}

class PageViewAddressMethod extends StatefulWidget {
  const PageViewAddressMethod({
    super.key,
  });

  @override
  State<PageViewAddressMethod> createState() => _PageViewAddressMethodState();
}

class _PageViewAddressMethodState extends State<PageViewAddressMethod> {
  static final List<Address> addresses = [
    Address(
      address: '123 Main St, New York, NY 10001',
      addressName: 'John Doe',
      addressPhone: '123-456-7890',
    ),
    Address(
      address: '123 Main St, New York, NY 10001',
      addressName: 'John Doe',
      addressPhone: '123-456-7890',
    ),
    Address(
      address: '123 Main St, New York, NY 10001',
      addressName: 'John Doe',
      addressPhone: '123-456-7890',
    ),
  ];

  // final int addressLength = addresses?.length ?? 0;

  int addressIndexChosen = 0;

  /// Function to change the chosen address
  void changeAddressIndexChosen(int index) {
    setState(() {
      addressIndexChosen = index;
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
                  for (int i = 0; i < addresses.length; i++)
                    CardAddress(
                      address: addresses[i].address,
                      addressName: addresses[i].addressName,
                      addressPhone: addresses[i].addressPhone,
                      isChosen: i == addressIndexChosen,
                      changeAddressIndexChosen: () {
                        changeAddressIndexChosen(i);
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
                  child: const Text('Add new Address'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewPaymentMethod extends StatefulWidget {
  const PageViewPaymentMethod({super.key});

  @override
  State<PageViewPaymentMethod> createState() => _PageViewPaymentMethodState();
}

class _PageViewPaymentMethodState extends State<PageViewPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}

// class CardAddress extends StatelessWidget {
//   const CardAddress({
//     super.key,
//     required this.address,
//     required this.addressName,
//     required this.addressPhone,
//     required this.isChosen,
//     required this.changeAddressIndexChosen,
//   });

//   final String address;
//   final String addressName;
//   final String addressPhone;
//   final bool isChosen;
//   final Function changeAddressIndexChosen;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         changeAddressIndexChosen();
//       },
//       child: CardContainer(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Radio(
//                     value: isChosen,
//                     groupValue: true,
//                     onChanged: (bool? value) {},
//                   ),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         addressName,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(address),
//                       Text(addressPhone),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.edit),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardPaymentMethod extends StatelessWidget {
//   const CardPaymentMethod({
//     super.key, required String paymentMethodExpireDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class Address {
//   final String address;
//   final String addressName;
//   final String addressPhone;

//   Address({
//     required this.address,
//     required this.addressName,
//     required this.addressPhone,
//   });
// }

// class PaymentMethodViewable {
//   final String paymentMethod;
//   final String paymentMethodNumber;
//   final String paymentMethodExpireDate;

//   PaymentMethodViewable({
//     required this.paymentMethod,
//     required this.paymentMethodNumber,
//     required this.paymentMethodExpireDate,
//   });
// }

/// The possible page view indexes are 0, 1, 2
/// 0: Payment methods
/// 1: Address details
/// 2: Order summary
/// 0.1: Payment methods -> Add new card
/// 0.2: Payment methods -> Edit card
/// 1.1: Address details -> Add new address
/// 1.2: Address details -> Edit address
class PaymentHeader extends StatelessWidget {
  const PaymentHeader({
    super.key,
    required this.pageViewIndex,
  });

  final int pageViewIndex; // 0, 1, 2

  @override
  Widget build(BuildContext context) {
    // const Icon backIcon = Icon(Icons.arrow_back_ios);
    // const Icon closeIcon = Icon(Icons.close);
    // const Icon editIcon = Icon(Icons.edit);
    // const Icon addIcon = Icon(Icons.add);
    const IconData cardIcon = Icons.credit_card;
    const IconData addressIcon = Icons.location_on;
    const IconData summaryIcon = Icons.receipt;

    IconData getCorrectIcon(int index) {
      switch (index) {
        case 0:
          return cardIcon;
        case 1:
          return addressIcon;
        case 2:
          return summaryIcon;
        default:
          return cardIcon;
      }
    }

    Icon getCorrectIconColor(int index) {
      final IconData icon = getCorrectIcon(index);
      if (pageViewIndex == index) {
        return Icon(
          icon,
          color: Colors.white,
        );
      } else {
        return Icon(
          icon,
          color: Colors.black,
        );
      }
    }

    List<Widget> getAllIconsRow() {
      final List<Widget> iconsRow = [];
      for (int i = 0; i < 3; i++) {
        iconsRow.add(getCorrectIconColor(i));
      }
      return iconsRow;
    }

    final List<Widget> iconsRow = getAllIconsRow();

    return Container(
      height: 75,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: iconsRow,
      ),
    );
  }
}

class PaymentFooter extends StatelessWidget {
  const PaymentFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const int subtotal = 100;
    const int shipping = 10;
    const int total = subtotal + shipping;
    final String? address =
        '123 Main St, New York, NY 10001 123 Main St, New York, NY 10001';
    final String? card = '**** **** **** 1234';
    // final String? address = null;
    // final String? card = null;
    return Container(
        height: 100,
        color: Theme.of(context).colorScheme.primary,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextLineInPaymentFooter(
                textTitle: 'Subtotal',
                textValue: '\$$subtotal',
              ),
              TextLineInPaymentFooter(
                textTitle: 'Shipping',
                textValue: '\$$shipping',
              ),
              TextLineInPaymentFooter(
                textTitle: 'Total',
                textValue: '\$$total',
              ),
              address != null
                  ? TextLineInPaymentFooter(
                      textTitle: 'Address',
                      textValue: address,
                    )
                  : SizedBox.shrink(),
              card != null
                  ? TextLineInPaymentFooter(
                      textTitle: 'Card',
                      textValue: card,
                    )
                  : SizedBox.shrink(),
            ]));
  }
}

class TextLineInPaymentFooter extends StatelessWidget {
  final String textTitle;
  final String textValue;
  const TextLineInPaymentFooter(
      {super.key, required this.textTitle, required this.textValue});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      // fontSize: 20,
      fontWeight: FontWeight.bold,
      // decoration: TextDecoration.underline,
      color: Colors.white,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Text(
            textTitle,
            style: textStyle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
              minWidth: 100,
              maxHeight: 20,
              minHeight: 20,
            ),
            child: FittedBox(
              child: Text(
                textValue,
                style: textStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
