import 'package:flutter/material.dart';

void showSnakBarMessage(BuildContext context, String message,
    {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
