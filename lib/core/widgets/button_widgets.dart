import 'package:flutter/material.dart';
import 'package:menu_demo/core/base/context_extensions.dart';

class SpButton extends StatelessWidget {
  const SpButton({
    this.text,
    super.key,
    this.ontap,
  });
  final String? text;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: context.dynamicWidth(0.25),
        height: context.dynamicHeight(0.1),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            text ?? '',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
