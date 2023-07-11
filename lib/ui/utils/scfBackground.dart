import 'package:flutter/material.dart';

class ScaffoldBackgroundImageWidget extends StatelessWidget {
  const ScaffoldBackgroundImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bgimage.png"),
            fit: BoxFit.cover,
            opacity: 0.5),
      ),
    );
  }
}