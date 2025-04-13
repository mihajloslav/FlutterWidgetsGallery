import 'package:flutter/material.dart';

import 'cupertino_widgets_page.dart';
import 'material_widgets_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[200], // Light gray background
          appBar: AppBar(
            title: Text(
              'Material vs Cupertino Widgets',
              style: TextStyle(fontSize: 18), // Reduced font size
            ),
            bottom: TabBar(
              tabs: [Tab(text: 'Material'), Tab(text: 'Cupertino')],
            ),
          ),
          body: TabBarView(
            children: [MaterialWidgetsPage(), CupertinoWidgetsPage()],
          ),
        ),
      ),
    );
  }
}
