import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/staff.dart';
import '../providers/staff_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _form = GlobalKey<FormState>();

  var _editedStaff = StaffInfo(
    id: null,
    first: '',
    last: '',
  );

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Provider.of<StaffProvider>(context, listen: false)
        .addStaffProvider(_editedStaff);
    print(_editedStaff.first);
    print(_editedStaff.last);
    print(DateTime.now().toString());
    _form.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Exercise'),
        actions: <Widget>[
          IconButton(
              onPressed: _saveForm,
              icon: Icon(
                Icons.save,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
              onSaved: (value) {
                _editedStaff = StaffInfo(
                  id: null,
                  first: value,
                  last: _editedStaff.last,
                );
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please provide a last name.';
                }
                return null;
              },
              // textInputAction: TextInputAction.done,
              // onFieldSubmitted: (_) {
              //   _saveForm();
              // },
              onSaved: (value) {
                _editedStaff = StaffInfo(
                  id: null,
                  first: _editedStaff.first,
                  last: value,
                );
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Passcode',
              ),
              validator: (value) {
                if (!value.contains('jtmoney')) {
                  return 'Please enter a valid passcode';
                }
                return null;
              },
              onSaved: (value) {
                _editedStaff = StaffInfo(
                  id: null,
                  first: _editedStaff.first,
                  last: _editedStaff.last,
                );
              },
            ),
            FlatButton(
              color: Colors.amberAccent,
              hoverColor: Colors.amber,
              onPressed: _saveForm,
              child: Text('Submit'),
            )
          ]),
        ),
      ),
    );
  }
}
