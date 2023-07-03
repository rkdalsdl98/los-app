import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final String? suffixText;
  final String type;
  final Function(String, dynamic)? addData;
  final String? Function(String?) validator;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixText,
    required this.type,
    this.addData,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        obscureText: obscureText,
        onSaved: (value) {
          if (addData != null) {
            addData!(type, value);
          }
        },
        validator: (value) => validator(value),
        controller: controller,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 14,
          fontFamily: 'SpoqaHanSans',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.background,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.orange,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFD9DDEB),
            ),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
              )),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFFE94251),
            ),
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
            fontSize: 14,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
          hintText: hintText,
          suffixText: suffixText,
          suffixStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
            fontSize: 8,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
