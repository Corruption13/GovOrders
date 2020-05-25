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
        color: Colors.white,
        child: Container(

          child: Column(
            children: [
              department(context, "Health and Family Welfare", "assets/department/health.jpeg", Colors.purple, Icons.local_hospital),
              department(context, "Finance", "assets/department/finance.jpeg", Colors.indigo, Icons.monetization_on),
              department(context, "Local Self Government", "assets/department/lsgd.jpeg", Colors.blue, Icons.accessibility),
              department(context, "General Administration", "assets/department/general.jpeg", Colors.green, Icons.laptop),
              department(context, "Personnel and Administrative", "assets/department/personnel.jpeg", Colors.yellow, Icons.person_outline),
              department(context, "Stores Purchase", "assets/department/bill.png", Colors.orange, Icons.euro_symbol),
              department(context, "Revenue", "assets/department/revenue.jpg", Colors.red, Icons.assessment),
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
                color: Colors.white,
                child: FlatButton(
                  onPressed: (){Navigator.pushNamed(context, "/loading", arguments: {"Dept": deptID, "page": "1"}) ;},
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft:  Radius.circular(15.0),
                              topRight:  Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)
                          )
                      ),
                      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(left: 25.0, ),
                            //child: Icon(
                              //icon,
                            //  size: 45,
                           // ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.0),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(13.0),
                                child: Image.asset(
                                  img,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )

                          ),
                          SizedBox(width: 42,),
                          Flexible(

                              child: Container(
                                child: Text(
                                  deptID,
                                  textScaleFactor: 1.0,
                                  style: TextStyle(

                                      color: Colors.grey[900],
                                      fontSize: 15.0,
                                      letterSpacing: 1.0
                                  ),
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