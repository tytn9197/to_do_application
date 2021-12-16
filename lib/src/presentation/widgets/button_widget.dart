import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_list/src/utils/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPress;
  final IconData icon;
  final double width;
  final double height;
  final String text;
  final EdgeInsetsGeometry margin;

  const ButtonWidget({Key? key,
    required this.onPress,
    required this.icon,
    required this.width,
    required this.height,
    required this.text,
    required this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration buttonBoxDecoration = BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: kButtonColor);

    return Container(
        width: width,
        height: height,
        margin: margin,
        decoration: buttonBoxDecoration,
        child: TextButton(
            style: TextButton.styleFrom(alignment: Alignment.center),
            onPressed: onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 1.w),
                  child: Text(
                    '$text',
                    style: TextStyle(
                        fontSize: 2.5.h,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(icon,
                    color: Colors.white, size: 3.5.h),
              ],
            )));
  }
}
