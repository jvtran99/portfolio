import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './screens/homepage.dart';
import './providers/staff_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => StaffProvider(),
      child: MaterialApp(
        title: 'Flutter Demo2.1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
