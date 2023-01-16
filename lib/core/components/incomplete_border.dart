import 'package:coffe_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class IncompleteBorder extends StatelessWidget {
  const IncompleteBorder({
    super.key, 
    required this.child, 
    required this.width, 
    required this.height, 
    this.radius = 20, 
    this.padding = const EdgeInsets.all(10), 
    this.backgroundColor = AppColors.brown_100, 
    this.borderColor = AppColors.black_900,

  });

  final Widget child;
  final double width;
  final double height;
  final double radius;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: width - 1,
              height: height - 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: borderColor.withOpacity(0.6)
              ),
            ),
          ),
          Center(
            child: Container(
              width: width + 2,
              height: height * 0.4,
              color: backgroundColor,
            ),
          ),  
          Center(
            child: Container(
              width: width * 0.4,
              height: height + 2,
              color: backgroundColor,
            ),
          ),    
          Center(
            child: Container(
              width: width - 3,
              height: height - 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: backgroundColor
              ),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}