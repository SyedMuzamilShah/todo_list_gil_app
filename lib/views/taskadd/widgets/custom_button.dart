import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final Function buttonFunction;
  final bool loading;
  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonIcon,
    required this.buttonFunction,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return loading ? const Center(child: CircularProgressIndicator(),)
    :
    ElevatedButton(
        onPressed: () => buttonFunction(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: buttonIcon != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [Text(buttonText), Icon(buttonIcon)],
          ),
        ));
  }
}
