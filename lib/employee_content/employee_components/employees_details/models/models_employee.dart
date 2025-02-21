// lib/models/Employee.dart

import 'package:amplify_flutter/amplify_flutter.dart';

class Employee {
  final String id;
  final String name;
  String? image;
  final DateTime dateOfJoining;
  final String gender;
  final String position;
  final double salary;
  final String currentAddress;
  final String permanentAddress;
  final bool sameAsAbove;
  final String mobileNumber;
  String? proofDocument;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Employee({
    required this.id,
    required this.name,
    this.image,
    required this.dateOfJoining,
    required this.gender,
    required this.position,
    required this.salary,
    required this.currentAddress,
    required this.permanentAddress,
    required this.sameAsAbove,
    required this.mobileNumber,
    this.proofDocument,
    this.createdAt,
    this.updatedAt,
  });

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      dateOfJoining: DateTime.parse(map['dateOfJoining']),
      gender: map['gender'],
      position: map['position'],
      salary: map['salary'],
      currentAddress: map['currentAddress'],
      permanentAddress: map['permanentAddress'],
      sameAsAbove: map['sameAsAbove'],
      mobileNumber: map['mobileNumber'],
      proofDocument: map['proofDocument'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'dateOfJoining': dateOfJoining.toIso8601String(),
      'gender': gender,
      'position': position,
      'salary': salary,
      'currentAddress': currentAddress,
      'permanentAddress': permanentAddress,
      'sameAsAbove': sameAsAbove,
      'mobileNumber': mobileNumber,
      'proofDocument': proofDocument,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
