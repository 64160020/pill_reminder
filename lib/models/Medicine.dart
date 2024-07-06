// ignore_for_file: unused_import

import "package:flutter/cupertino.dart";

class Medicine {
  final List<dynamic>? notificationIDs;
  final String? medicineName;
  final int? dosage;
  final String? medicineType;
  final int? interval;
  final String? startTime;
  final String? nameID; // เพิ่มฟิลด์นี้

  Medicine(
      {this.notificationIDs,
        this.medicineName,
        this.dosage,
        this.medicineType,
        this.interval,
        this.startTime,
        this.nameID // เพิ่มฟิลด์นี้
      });

  // getters
  String get getName => medicineName!;
  int get getDosage => dosage!;
  String get getType => medicineType!;
  int get getInterval => interval!;
  String get getStartTime => startTime!;
  List<dynamic> get getIDs => notificationIDs!;
  String get getNameID => nameID!; // เพิ่ม getter นี้

  Map<String, dynamic> toJson(){
    return {
      'ids': notificationIDs,
      'name': medicineName,
      'dosage': dosage,
      'type': medicineType,
      'interval': interval,
      'start': startTime,
      'nameID': nameID, // เพิ่มฟิลด์นี้
    };
  }

  factory Medicine.fromJson(Map<String, dynamic> parsedJson){
    return Medicine(
      notificationIDs: parsedJson['ids'],
      medicineName: parsedJson['name'],
      dosage: parsedJson['dosage'],
      medicineType: parsedJson['type'],
      interval: parsedJson['interval'],
      startTime: parsedJson['start'],
      nameID: parsedJson['nameID'], // เพิ่มฟิลด์นี้
    );
  }
}
