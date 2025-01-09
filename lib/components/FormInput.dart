import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.title,
    required this.hintText,
  });
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextField(
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}