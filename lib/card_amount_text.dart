import 'package:flutter/material.dart';

class CardAmountText extends StatelessWidget {
  const CardAmountText({
    super.key,
    required this.amount,
    required this.text,
    this.isTitleAmount = false,
  });

  final double amount;
  final String text;
  final bool isTitleAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: const TextStyle(color: Colors.white70)),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: isTitleAmount ? 40 : 20,
          ),
        ),
      ],
    );
  }
}
