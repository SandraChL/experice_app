import 'package:flutter/material.dart';

class BackButtonRounded extends StatelessWidget {
  const BackButtonRounded({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400, width: 1.5),
          ),
          child: const Icon(Icons.arrow_back, size: 20, color: Colors.grey),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
