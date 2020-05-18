
import 'package:beautifulsoup/beautifulsoup.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';


Map deptNo = {
  "Finance": "42975",
  "General Administration": "58256",
  "Health and Family Welfare": "190865",
  "Local Self Goverment": "57982",
  "Revenue": "58233",

};

Map dataFormat(List Q){
  Map data = {
      "departmentId" : Q[0],
      "lineDepmnt": Q[1],
      "fromdate": Q[2],
      "todate": Q[3],
      "keyword": Q[4],
  } ;
  return data;
}


Future scrape(List Q) async{
  String url = "https://kerala.gov.in/gos/circulars?p_p_id=GovernmentResolutions_WAR_ssdgportlet_INSTANCE_lQv99fpalK7U&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_GovernmentResolutions_WAR_ssdgportlet_INSTANCE_lQv99fpalK7U_myaction=grResults";
  Map data = dataFormat(Q);

  Response response = await post(url, body: data) ;
  var decoded = utf8.decode(response.bodyBytes);
  // print(decoded) ;

  return bsoup(decoded);
  
}





List bsoup(String html){

  var soup = Beautifulsoup(html);
  var tablelist = soup.find_all("table").map((e) => (e.outerHtml)).toList(); // Find all the tables in doc

  soup = Beautifulsoup(tablelist[2]) ;    // Extract thurd table, which always has the GO.

  var innertables = soup.find_all("table").map((e)=> (e.text)).toList()[0];     // Inner tables is the first table. 
  
  var linktables = soup.find_all("table").map((e)=> (e.innerHtml)).toList()[0];
  soup = Beautifulsoup(linktables);

  var goList = innertables.split("Sr.No. Department Name Title Issue Date View/Download")[1]; // Clean up the title <tr> from <tb>
  var finalList = goList.split("  "); // Split each order delimited by double whitespace.

  var links = soup.find_all("a");

  var linksList = []; // To pull out the pdf url and append onto it.

  for(int i = 0; i< links.length; i++){  
      if(links[i].text[0] == "("){

        var href = links[i].outerHtml.split("')")[0]; 
        href = href.split("('").last;                     // Extract href from the <a> tag, basically.


        href = "https://kerala.gov.in" + href;  // Add base url
        linksList.add(href);

      }

  }

  finalList.removeAt(0);
  finalList.removeLast();           // Trimming the garbage text at beginning and end of list.
  finalList.removeLast();
  finalList[0] = finalList[0].substring(1);   // First order seems to have a white space in front.
  finalList[finalList.length-1] = finalList[finalList.length-1].split(" item")[0]   ;

  
  List<Map> finalOrders = []; 
  for(int i = 0; i< finalList.length; i++){
      //print("-> ${finalList[i]} \n");
      finalOrders.add(parseOrder(finalList[i], linksList[i])) ;
  }
  return finalOrders;
  //var t = soup.find(id:"GOList");
  // print(t.text);
}


Map parseOrder(String order, String url){
    String index = order.split(" ")[0];
    order = order.substring(index.length);
    if (order.indexOf('G.O') != -1){      // Not a GO 
      int textEnd = order.indexOf('G.O');
      String text = order.substring(0, textEnd);


      order = order.substring(textEnd);

      String size = order.split("(").last;
      size = size.split(")")[0];
      order = order.split(" ("+ size)[0];
      String date = order.split(" ").last;
      order = order.split(date)[0];

      //print("-> $order!");

      Map details = {
              "index": index,
              "GO_NO": order,
              "text": text,
              "size": size,
              "url": url,
        }; 
        print("-> $details!");
      return details;
      //print(order);
    }
    return null;
}

void main(){
    List<String> Query = [deptNo["Finance"], "0", "", "", ""];
    scrape(Query);


}