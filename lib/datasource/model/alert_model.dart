import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel {
  String? alertId;
  AlertBody? body;

  AlertModel.fromJson(Map<String, dynamic> json)
      : body = AlertBody.fromJson(json['body']),
        alertId = json['alertId'];

  AlertModel.fromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    if (snapshot != null) {
      body = snapshot['body'];
      alertId = snapshot['alertId'];
    }
  }
}

class AlertBody {
  String? message;

  AlertBody.fromJson(Map<String, dynamic> json) : message = json['message'];

  AlertBody.fromDoc(DocumentSnapshot<Map<String, dynamic>>? snapshot) {
    if (snapshot != null) {
      message = snapshot['message'];
    }
  }
}
