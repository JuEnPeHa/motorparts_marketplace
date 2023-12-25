import 'package:flutter/material.dart';

class TextLineInPaymentFooter extends StatelessWidget {
  final String textTitle;
  final String textValue;
  const TextLineInPaymentFooter(
      {super.key, required this.textTitle, required this.textValue});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
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
