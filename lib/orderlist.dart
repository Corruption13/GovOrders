import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'orders.dart';
import 'package:url_launcher/url_launcher.dart';


class OrderList extends StatefulWidget{
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<String>  queryInstance = ["Revenue", "0", "", "", ""];
  OrdersClass orders;
  Map data = {} ;





  Widget orderPanelGenerator(OrdersClass order){

    return Card(
        child: Container(
          color: Colors.blue[600],
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(35.0),
                    topRight:  Radius.circular(35.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(8.0)
                  )
              ),
              padding: const EdgeInsets.all(25.0),
              margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    order.subject,
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 14.0,
                        letterSpacing: 2.0
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: Text(
                          order.goNo,
                          style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 14.0,
                              letterSpacing: 1.0
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(width: 1.0)),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.date,
                              style: TextStyle(
                                  color: Colors.teal[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  letterSpacing: 1.0
                              ),

                            ),
                            SizedBox(height: 5),
                            Text(
                              order.section,

                              style: TextStyle(
                                  color: Colors.brown[900],
                                  fontSize: 12.0,
                                  letterSpacing: 1.0
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(width: 1.0)),
                      Expanded(
                        flex: 3,
                        child:Column(
                          children: [
                            RaisedButton.icon(
                              onPressed: (){
                                //print(order.pdfUrl);
                                _launchURL(order.pdfUrl);
                                },
                              icon: Icon(Icons.picture_as_pdf),
                              label: Text(""),
                              color: Colors.red[500],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(5),
                                  )
                              )
                            ),
                            Text(
                              order.size,
                              style: TextStyle(

                                color: Colors.red[900],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(width: 1.0)),
                    ],
                  )
                ],
              )
          ),
        )
    );
  }


  Widget pageMove(BuildContext context){

    return Container(

      decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(20.0),
              topRight:  Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)
          )
      ),

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            RaisedButton.icon(
                onPressed: (){
                  var page = (int.parse(data["page"]) - 1).toString() ;
                  if(int.parse(page) > 0)
                    Navigator.pop(context) ;
                },
                icon: Icon(Icons.navigate_before),
                label: Text("Previous Page",
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                    )
                )
            ),


            Text(" Page ${data["page"]} ",) ,

            RaisedButton.icon(
                onPressed: (){
                  var page = (int.parse(data["page"]) + 1).toString() ;
                  if(int.parse(page) < 1000)
                    Navigator.pushNamed(context, "/loading", arguments: {"Dept": data["query"][0], "page": page}) ;
                },
                icon: Icon(Icons.navigate_next),
                label: Text("Next Page",
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
                color: Colors.blue[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular((20)),
                    )
                )
            ),

          ],

        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    var tables = data["Data"];
    //print("data-> ${data["page"]}");
    //print("Before Cleaner ${tables}");
    //print("Table:  ${tables[0]} ");

    List<OrdersClass> orders = cleaner(tables);

    return Container(

      child: Scaffold(
        appBar: AppBar(
          title: Text("Government Orders"),

          backgroundColor: Colors.blue[900],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue[700],
            child: Column(
              children: [

                pageMove(context),
                Column(
                    children:
                      orders.map((x) {

                        return orderPanelGenerator(x);

                      } ).toList(),
                ),
                pageMove(context)

              ],
            ),
          ),
        ),
      ),
    );

  }
}


List<OrdersClass> cleaner(dynamic tables){

  List<OrdersClass> orders = [];
  for(int i = 0; i < tables.length; i++){

    if( tables[i]["index"] == null)
      tables[i]["index"] = "";
    if( tables[i]["GO_NO"] == null)
      tables[i]["GO_NO"] = "";
    if( tables[i]["date"] == null)
      tables[i]["date"] = "";
    if( tables[i]["dept"] == null)
      tables[i]["dept"] = "";
    if( tables[i]["size"] == null)
      tables[i]["size"] = "";
    if( tables[i]["url"] == null)
      tables[i]["url"] = "";
    if( tables[i]["text"] == null)
      tables[i]["text"] = "";

    OrdersClass instance = OrdersClass(
      index: tables[i]["index"],
      goNo: tables[i]["GO_NO"],
      date: tables[i]["date"],
      section: tables[i]["dept"],
      subject: tables[i]["text"],
      size: tables[i]["size"],
      pdfUrl:tables[i]["url"] ,

    );
    orders.add(instance);
  }

  return orders;
}



_launchURL(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



