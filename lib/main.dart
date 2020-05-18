import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'orders.dart';

void main() => runApp(MaterialApp(
        home: Home(),
      )
);

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    int a = 0;
    List<Orders> Orders_List = [
        Orders(
            go_no: "GO(P) No. 53/2020/Fin",
            date: "15/3/2020",
            section: "Health",
            subject: "	Extraordinary Gazette Notification - Deferment of pay and allowance for Government employees, employees of LSGIs, Statutary bodies etc..."
        ),
        Orders(
          go_no: "GO(P) No. 52/2020/Fin",
          date: "10/3/2020",
          section: "Finance",
          subject: "	Lockdown declared in the nation consequent to the Novel Cocona Virus (Covid - 19) outbreak - Extension of deputation of Officers on deputation during the currency of lockdown - orders issued"
        ),
        Orders(
            go_no: "GO(P) No. 51/2020/Fin",
            date: "2/3/2020",
            section: "Loans",
            subject: "IFMS - Administrative Sanction for the procurement of items related to the implementation of Information Security Management System (ISMS) in the Treasury Department - Sanctioned - orders issued"
        ),

    ];

    Widget orderPanelGenerator(Orders order){

      return Card(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
            child: Flexible(
            child: Column(
              children: <Widget>[
                Text(
                  order.subject,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    letterSpacing: 2.0
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      order.go_no,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 18.0,
                        letterSpacing: 1.0
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      order.date,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18.0,
                          letterSpacing: 1.0
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      order.section,

                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20.0,
                          letterSpacing: 1.0
                      ),
                    ),
                    SizedBox(width: 40.0),
                  ],
                )
              ],
            ),
            )
          )
      );
    }
    @override
    Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
            title: Text("Orders!"),
            ),
          body: Column(
            children: Orders_List.map( (x) => orderPanelGenerator(x) ).toList()
            ),
          ),
        );

  }
}

