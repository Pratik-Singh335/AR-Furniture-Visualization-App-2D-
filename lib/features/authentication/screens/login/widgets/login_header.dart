import 'package:flutter/material.dart';

class MLoginHeader extends StatelessWidget {
  const MLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Login', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
