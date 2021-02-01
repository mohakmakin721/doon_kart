import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User{
  final String address,age,email,first_name,last_name,phone_number,uid;

  User(
      {this.address,
      this.age,
      this.email,
      this.first_name,
      this.last_name,
      this.phone_number,
      this.uid});
}

