import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/staff.dart';

class StaffProvider with ChangeNotifier {
  List<StaffInfo> _items = [];

  List<StaffInfo> get items {
    return [..._items];
  }

  addStaffProvider(StaffInfo staffInfo) {
    const url = 'https://api-exercise-d877e.firebaseio.com/staff.json';
    http.post(
      url,
      body: json.encode({
        'first': staffInfo.first,
        'last': staffInfo.last,
        'submitted_date': DateTime.now().toString(),
      }),
    );
    notifyListeners();
  }
}
