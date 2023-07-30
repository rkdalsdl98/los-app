import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';

class PersornalReminder extends StatelessWidget {
  final QuerySnapshot<Map<String, dynamic>>? alerts;

  const PersornalReminder({super.key, this.alerts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          '알림',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 24,
            fontFamily: 'SpoqaHanSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/los_background_translate.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: alerts == null
            ? Container()
            : Column(
                children: [
                  if (alerts!.docs.isEmpty) Container(),
                  for (var alert in alerts!.docs)
                    notifyWrapHelper(context, text: alert['message'])
                ],
              ),
      ),
    );
  }

  Container notifyWrapHelper(
    BuildContext context, {
    String? text,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      height: 30 * getScaleFactorFromWidth(context),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 1,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 12 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            Icons.close,
            size: 14 * getScaleFactorFromWidth(context),
          ),
        ],
      ),
    );
  }
}
