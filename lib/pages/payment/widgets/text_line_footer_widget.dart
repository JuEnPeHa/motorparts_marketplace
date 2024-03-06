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
    final double height = 20;
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: FittedBox(
              child: Text(
                textTitle,
                style: textStyle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300,
                minWidth: 100,
                maxHeight: height,
                minHeight: height,
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
      ),
    );
  }
}
