import 'package:flutter/material.dart';

double getScaleFactorFromWidth(BuildContext context) {
  return (MediaQuery.of(context).size.width / 360);
}

double getScaleFactorFromHeight(BuildContext context) {
  return (MediaQuery.of(context).size.height / 480);
}
