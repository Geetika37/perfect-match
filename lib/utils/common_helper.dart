import 'package:flutter/material.dart';

Widget hSpace(double height)
{
  return SizedBox(height: height,);
}

Widget wSpace(double width)
{
  return SizedBox(width: width,);
}

double getDeviceHeight(BuildContext context) {
  final padding = MediaQuery.of(context).padding;
  return MediaQuery.of(context).size.height - padding.top - padding.bottom;
}

double getDeviceTop(BuildContext context) {
  final padding = MediaQuery.of(context).padding;
  double topPadding = padding.top;
  return topPadding;
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}