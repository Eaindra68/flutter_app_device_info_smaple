import 'package:flutter/material.dart';

class ShowCard extends StatelessWidget {
  ShowCard({
    super.key,
    required this.name,
    required this.value,
  });

  final String name, value;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          "$name : $value",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
