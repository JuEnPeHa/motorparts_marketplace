import 'package:flutter/cupertino.dart';
import 'package:motorparts_marketplace/widgets/card_container.dart';

class AddNewAndSelectButton extends StatelessWidget {
  final int actualPageViewIndex;
  final int? actualAddressOrPaymentIndexChosen;
  // If lengthOfAddressesOrPaymentMethods is 0, then the button Select Address or Select Payment Method will not be shown
  final int lengthOfAddressesOrPaymentMethods;
  // onPressedAddNewButton
  // onPressedSelectButton
  final void Function()? onPressedAddNewButton;
  final void Function()? onPressedSelectButton;
  const AddNewAndSelectButton({
    super.key,
    required this.actualPageViewIndex,
    this.actualAddressOrPaymentIndexChosen,
    required this.lengthOfAddressesOrPaymentMethods,
    required this.onPressedAddNewButton,
    required this.onPressedSelectButton,
  });

  @override
  Widget build(BuildContext context) {
    if (actualPageViewIndex == 2) {
      return const SizedBox.shrink();
    } else {
      return Row(
        children: [
          Expanded(
            flex: 1,
            child: CardContainer(
              child: Container(
                height: 50,
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: onPressedAddNewButton,
                  child: Text(
                    actualPageViewIndex == 1
                        ? 'Add new Address'
                        : 'Add new Payment Method',
                  ),
                ),
              ),
            ),
          ),
          lengthOfAddressesOrPaymentMethods == 0
              ? SizedBox.shrink()
              : Expanded(
                  flex: 1,
                  child: CardContainer(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: CupertinoButton(
                        onPressed: onPressedSelectButton,
                        child: Text(
                          actualPageViewIndex == 1
                              ? 'Select Address'
                              : 'Select Payment Method',
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      );
    }
  }
}
