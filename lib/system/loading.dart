import 'package:flutter/material.dart';

void showLoadingIndicator(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Container(
        color: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
    },
  );
}
