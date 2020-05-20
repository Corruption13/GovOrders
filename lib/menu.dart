import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Select Department"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Container(

          child: Column(
            children: [
              department(context, "Health and Family Welfare", "placeholder.png", Colors.purple, Icons.local_hospital),
              department(context, "Finance", "placeholder.png", Colors.indigo, Icons.monetization_on),
              department(context, "Local Self Government", "placeholder.png", Colors.blue, Icons.accessibility),
              department(context, "General Administration", "placeholder.png", Colors.green, Icons.laptop),
              department(context, "Personnel and Administrative", "placeholder.png", Colors.yellow, Icons.person_outline),
              department(context, "Stores Purchase", "placeholder.png", Colors.orange, Icons.euro_symbol),
              department(context, "Revenue", "placeholder.png", Colors.red, Icons.assessment),
            ],

          ),

        ),

      ),
    );
  }
}


Widget department(BuildContext context, String deptID, String img, MaterialColor color, IconData icon ){
    return Container(

        child: Expanded(
          child: Card(
              child: Container(
                color: Colors.black,
                child: FlatButton(
                  onPressed: (){Navigator.pushNamed(context, "/loading", arguments: {"Dept": deptID, "page": "1"}) ;},
                  child: Container(
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              topLeft:  Radius.circular(35.0),
                              topRight:  Radius.circular(35.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(8.0)
                          )
                      ),
                      padding: const EdgeInsets.all(30.0),
                      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                      child: Row(
                        children: <Widget>[

                          Icon(
                            icon,
                            size: 60,
                          ),
                          SizedBox(width: 42,),
                          Flexible(
                              child: Text(
                                deptID,
                                style: TextStyle(

                                    color: Colors.grey[900],
                                    fontSize: 20.0,
                                    letterSpacing: 2.0
                                ),
                              ),

                          ),




                        ],
                      )
                  ),
                ),
              )
          ),
        )
    );



}