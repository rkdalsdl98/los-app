import 'package:flutter/material.dart';

void snackBarErrorMessage(BuildContext context, String message, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 400,
      backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.errorContainer,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                fontFamily: 'SpoqaHanSans',
              ),
            ),
            Text(
              error,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: 'SpoqaHanSans',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void snackBarMessage(BuildContext context, String message, Icon? icon) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 400,
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 3000),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primaryContainer,
              fontWeight: FontWeight.w500,
              fontSize: 13,
              fontFamily: 'SpoqaHanSans',
            ),
          ),
          if (icon != null)
            const SizedBox(
              width: 10,
            ),
          if (icon != null) icon,
        ],
      ),
    ),
  );
}
