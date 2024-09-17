import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final String label;

  const CustomBackButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24),
          child: const Text("Add Income", style: TextStyle(fontSize: 24)),
        ),
      ],
    );
  }
}
