import 'package:college_bot/constants.dart';
import 'package:flutter/material.dart';

class IconButtonCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? iconColor;
  final VoidCallback? onpressed;

  IconButtonCard(
      {required this.text,
      required this.icon,
      this.backgroundColor,
      this.height,
      this.width,
      this.iconColor,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed ?? () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          width: width ?? 120,
          height: height ?? 120,
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: iconColor ?? kblueTextColor,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
