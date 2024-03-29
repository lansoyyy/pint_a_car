import 'package:flutter/material.dart';
import 'package:pintacar/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? textColor;

  const ButtonWidget(
      {Key? key,
      this.radius = 15,
      required this.label,
      this.textColor = Colors.white,
      required this.onPressed,
      this.width = 300,
      this.fontSize = 18,
      this.height = 50,
      this.color = const Color(0xff578FFE)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        minWidth: width,
        height: height,
        color: color,
        onPressed: onPressed,
        child: TextWidget(text: label, fontSize: fontSize!, color: textColor));
  }
}
