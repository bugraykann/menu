import 'package:flutter/material.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }
}
