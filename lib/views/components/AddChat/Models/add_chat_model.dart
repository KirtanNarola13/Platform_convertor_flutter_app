import 'dart:io';

import 'package:flutter/material.dart';

class AddChatModel {
  List<String> fullName;
  List<String> phoneNumber;
  List<String> chatConversation;
  List<String> image;
  List<String> date;
  List<String> time;
  File? img;
  DateTime? tempDate;
  DateTime? pickDate;
  TimeOfDay? tempTime;
  TimeOfDay? pickTime;

  AddChatModel({
    required this.image,
    required this.fullName,
    required this.phoneNumber,
    required this.chatConversation,
    required this.date,
    required this.time,
    this.img,
    this.tempDate,
    this.pickDate,
    this.tempTime,
    this.pickTime,
  });
}
