import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                      Container(

                        child: Column(

                          children: [
                            MaterialButton(
                              onPressed:(){Navigator.pushNamed(context, "/menu") ;},
                              child: Container(
                                color: Colors.teal,
                                child: SizedBox(
                                    height: 50.0,
                                    width: 200,
                                    child: Center(
                                        child:
                                              Text("Government Orders",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),)


                                    )),
                              ),
                            ),
                            SizedBox(height: 20,),
                            MaterialButton(
                              onPressed: (){print("Coming soon");},
                              child: Container(
                                color: Colors.grey[900],
                                child: SizedBox(
                                    height: 50.0,
                                    width: 200,
                                    child: Center(
                                        child:
                                        Text("Search Order",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),)


                                    )),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(),


                  ],
                ),
              ),

              Expanded(

                  flex: 1,
                  child:


                  Column(
                    children: [
                      GestureDetector(
                          child:
                          Text("By KHSMSA Ernakulam",
                            style: TextStyle(
                              color: Colors.teal,
                                fontSize: 20.0
                            ),
                          ),
                          onTap: () {
                            _khsmsaWebsite();

                          }
                      ),
                      SizedBox(height: 42,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              child:
                              Text("About Me",
                                style: TextStyle(
                                  color: Colors.purple,
                                    fontSize: 10.0
                                ),
                              ),
                              onTap: () {
                                _aboutMe();
                              }
                          ),
                          SizedBox(width: 42.0,),
                          GestureDetector(
                              child:
                              Text("Report Bugs",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10.0
                                ),
                              ),
                              onTap: () {
                                _emailDev();

                              }
                          ),
                        ],
                      ),
                    ],
                  )


              )
            ],
          ),
        ),

      ),
    );
  }
}


_khsmsaWebsite() async{
  const url = 'https://www.khsmsaernakulam.org/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }

}

_aboutMe() async {
  const url = 'https://github.com/Corruption13';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


_emailDev() async {
  const url = 'mailto:sandeep.pillai42@gmail.com?subject=Govt. Orders App - Error Report';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}