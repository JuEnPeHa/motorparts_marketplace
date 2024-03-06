import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/widgets/card_container.dart';

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
