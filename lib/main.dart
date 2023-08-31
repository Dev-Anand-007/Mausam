

import 'package:flutter/material.dart';
import 'package:mausam/Activity/home.dart';
import 'package:mausam/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes:{
      "/":(context)=> Loading(),
      "/home":(context)=>  Home(),
      "/loading":(context)=>Loading(),
    },
  ));
}
