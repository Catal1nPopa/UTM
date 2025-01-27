import 'package:flutter/material.dart';
import 'address.dart';
import 'NotificationButton.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Address(),
        NotificationButton(),
      ],
    );
  }
}
