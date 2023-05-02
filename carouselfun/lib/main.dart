import 'package:flutter/material.dart';
import 'package:carouselfun/Pages/Loading.dart';
import 'package:carouselfun/Pages/home.dart';
import 'package:carouselfun/Pages/notes.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/notes': (context) => Notes(),
        },
      ),
    );
