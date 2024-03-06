import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/payment/widgets/text_line_footer_widget.dart';

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
