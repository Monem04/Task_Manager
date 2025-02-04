import 'package:flutter/material.dart';

class CenteredCirculerProgressIndicator extends StatelessWidget {
  const CenteredCirculerProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
