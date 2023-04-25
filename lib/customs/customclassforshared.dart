import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User {
  final String? username;
  final int? phone;
  final String password;

  User({required this.username,required this.phone, required this.password});
  Map<String, dynamic> _tojason() {
    return {"username": username, "phone": phone, "password": password};
  }

 String toJason() {
    return jsonEncode( _tojason() );
  } 
String userfromjason(String input) {
    return jsonDecode( input );
  }
}
