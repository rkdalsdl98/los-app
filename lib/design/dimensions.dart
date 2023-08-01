import 'package:flutter/material.dart';

const baseWidth = 404;
const baseHeight = 884;

double getScaleFactorFromWidth(BuildContext context) {
  return (MediaQuery.of(context).size.width / baseWidth);
}

double getScaleFactorFromHeight(BuildContext context) {
  return (MediaQuery.of(context).size.height / baseHeight);
}
