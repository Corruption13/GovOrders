import 'package:flutter/material.dart';
import 'orderlist.dart';
import 'menu.dart';
import 'base.dart';
import 'search.dart';

import 'loading.dart';


void main() => runApp(MaterialApp(

        routes: {
          "/": (context) => Base(),
          "/menu": (context) => Menu(),
          "/search": (context) => Search(),
          "/loading": (context) => Loading(),
          "/orderlist": (context) => OrderList(),     // Home is actually order.list -> List view
        },
      )
);








