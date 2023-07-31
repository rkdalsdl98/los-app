import 'package:flutter/material.dart';
import 'package:los_app/design/dimensions.dart';
import 'package:los_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../datasource/model/alert_model.dart';

class PersornalReminder extends StatefulWidget {
  final List<AlertModel>? alerts;

  const PersornalReminder({super.key, this.alerts});

  @override
  State<PersornalReminder> createState() => _PersornalReminderState();
}

class _PersornalReminderState extends State<PersornalReminder> {
  void onDeleteNotify(BuildContext context, String alertId) {
    setState(() {
      context.read<UserProvider>().deleteAlertDoc(alertId);
      widget.alerts!.removeWhere((e) => e.alertId == alertId);
    });
  }

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
        child: widget.alerts == null
            ? Container()
            : Column(
                children: [
                  if (widget.alerts!.isEmpty) Container(),
                  for (var alert in widget.alerts!)
                    notifyWrapHelper(context, alert, onDeleteNotify)
                ],
              ),
      ),
    );
  }

  Container notifyWrapHelper(
    BuildContext context,
    AlertModel alert,
    Function(BuildContext, String) onDelete,
  ) {
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
            alert.body!.message ?? '',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 12 * getScaleFactorFromWidth(context),
              fontFamily: 'SpoqaHanSans',
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: () => onDelete(context, alert.alertId!),
            child: Icon(
              Icons.close,
              size: 14 * getScaleFactorFromWidth(context),
            ),
          ),
        ],
      ),
    );
  }
}
