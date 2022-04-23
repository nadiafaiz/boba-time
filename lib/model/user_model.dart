import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? role;
  Timestamp? timestamp;

  UserModel({this.uid, this.email, this.fullName, this.role, this.timestamp});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      role: map['role'],
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'role': role,
      'timestamp': timestamp,
    };
  }
}

enum Role { user, admin }
