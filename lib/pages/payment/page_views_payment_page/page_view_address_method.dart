import 'package:flutter/cupertino.dart';
import 'package:motorparts_marketplace/pages/payment/models/address_model.dart';
import 'package:motorparts_marketplace/pages/payment/widgets/card_address.dart';

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
          ],
        ),
      ),
    );
  }
}
