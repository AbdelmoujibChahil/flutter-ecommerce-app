import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({Key? key, required this.value, required this.subTitle}) : super(key: key);

  final String value;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          "\$" + value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
