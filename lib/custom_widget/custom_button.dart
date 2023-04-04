import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.iconPath,
      this.bgColor,
      this.textColor,
        this.height,
        this.width,
        this.minHeight,
      required this.onTap});

  final String text;
  final double? height;
  final double? width;
  final String? iconPath;
  final Color? bgColor;
  final Color? textColor;
  final double? minHeight;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            // minimumSize: Size(minWidth ?? 300, minHeight ?? 50),
            // maximumSize: Size(maxWidth ?? 300, maxHeight ?? 50),
            backgroundColor: bgColor),
        child: SizedBox(
          height: minHeight ?? 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null)
                Row(
                  children: [
                    Image.asset(iconPath ?? "", height: height ?? 18, width: width ?? 18,),
                    const SizedBox(width: 10),
                  ],
                ),
              Text(
                text,
                style: TextStyle(color: textColor, fontFamily: "Roboto-Light"),
              ),
            ],
          ),
        ));
  }
}
