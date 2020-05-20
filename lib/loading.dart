import 'package:flutter/material.dart';
import 'scraper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String text = "Fetching Data" ;
  Map data = {};
  var item;


  void getData(String dept, String page) async{
    print("Begin $dept");
    List<String>  query = [dept, "0", "", "", ""];
    try{
      item = await scrape(query, dept, page);
      //print("-----> $item");
      setState(() {
        text = "Found!";
      });
    }
    catch(e){
      item = "Error: $e";
      setState(() {
        text = "Error Fetching data.\n Either your internet or the government servers are down.";
      });
    }
    if(item!=null)

      //print(item);
      Navigator.pushReplacementNamed(context, "/orderlist", arguments: {
        "Data": item,
        "query": query,
        "page": page,
      }) ;

    else {
      text = "No Orders found. Either your Internet or the Government Website Internet is down.";
      Future.delayed(const Duration(seconds: 5), () => Navigator.pop(context));
    }
  }

  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    if(data!=null) {
      setState(() {
        text = "Fetching data - [Page ${data["page"]}] ";
      });

      getData(data["Dept"], data["page"]);
    }
    else{
      getData("Finance", "1");
    }
    //print(data);
    return Container(
        child: Scaffold(
            body: Container(
              color: Colors.black,
              child: Center(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpinKitRotatingCircle(
                      color: Colors.red[700],
                      size: 50.0,
                    ),
                    SizedBox(height: 30),
                    Text(text,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.grey[600],
                        )
                    ),
                    SizedBox(height: 20.0,),



                  ],

                ),
              ),
            )
        )
    );
  }
}
