import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsets padding;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.bgColor = const Color(0xFFD20030),
    this.borderColor = const Color(0xFFD20030),
    this.textColor = Colors.white,
    this.fontSize = 13,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: borderColor,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(bgColor),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: GoogleFonts.workSans(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
