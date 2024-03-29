import 'package:flutter/material.dart';

class ProductErrorWidget extends StatelessWidget {
  final String exceptionMessage;

  const ProductErrorWidget({super.key, required this.exceptionMessage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          const SizedBox(height: 20),
          Text(exceptionMessage),
        ],
      ),
    );
  }
}
