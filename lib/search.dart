import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}


class SearchState extends State<Search> {

  final _formKey = GlobalKey<FormState>();

  String dept = "Select Department";
  String fromdate;
  String todate;
  String keyword;
  List<DropdownMenuItem<dynamic>> items = [];
  Widget _buildGO(){
    return DropdownButton<String>(
      value: dept,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dept = newValue;
        });
      },
      items: <String>['Select Department',
        'Health and Family Welfare',
        'Finance',
        'Local Self Government',
        'General Administration',
        "Personal and Administrative",
        "Stores Purchase",
        "Revenue",
      ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: Text("Search Order "),),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildGO(),

              RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                   print("Yes");
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}