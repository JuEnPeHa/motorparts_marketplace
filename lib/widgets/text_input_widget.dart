import 'package:flutter/material.dart';

class TextInputMotorplaceWidget extends StatelessWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int? heightOfThisWidget;
  const TextInputMotorplaceWidget({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.heightOfThisWidget,
  });

  @override
  Widget build(BuildContext context) {
    // final int heightOfThisWidget = 40;
    return TextFormField(
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 0,
        ),
        constraints: BoxConstraints(
          minHeight: heightOfThisWidget != null
              ? heightOfThisWidget!.toDouble()
              : 50.0,
          maxHeight: heightOfThisWidget != null
              ? heightOfThisWidget!.toDouble()
              : 50.0,
        ),
        errorStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          gapPadding: 0,
        ),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        floatingLabelStyle: Theme.of(context).textTheme.bodyLarge,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: const Text(
          'Motorplace',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.50),
        hintText: 'Motorplace',
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
