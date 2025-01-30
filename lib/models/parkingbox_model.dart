import 'package:flutter/material.dart';

class ParkingboxModel {
  final String Id;
  final int prn;
  final String name;

  ParkingboxModel({
    required this.Id,
    required this.prn,
    required this.name,
  });
}

List<ParkingboxModel> parking_list = [];
