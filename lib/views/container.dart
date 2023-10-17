import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color? color;
  const CustomContainer({super.key, required this.width, required this.text, required this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.black, width: 3.sp),
        color: color ?? Colors.transparent
      ),
      child: Text(text, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: color != null ? Colors.white : Colors.black)),
    );
  }
}
