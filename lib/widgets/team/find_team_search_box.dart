import 'package:flutter/material.dart';

import '../input_field.dart';

class FIndTeamSearchBox extends StatelessWidget {
  const FIndTeamSearchBox({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 40,
      child: InputField(
        controller: controller,
        hintText: null,
        prefixIcon: null,
        type: 'search',
        validator: null,
        customDecoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
            fontSize: 14,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            ),
          ),
          hintText: '팀을 검색해보세요!',
          suffixIcon: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              /**
               * 검색 알고리즘
               */
            },
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
            ),
          ),
        ),
      ),
    );
  }
}
