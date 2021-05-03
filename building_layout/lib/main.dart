import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Main Header",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Text(
                "Subheader description",
                style: TextStyle(color: Colors.grey),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtomColumn(color, Icons.call, 'CALL'),
        _buildButtomColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtomColumn(color, Icons.share, 'SHARE'),
      ],
    ));

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        " lorum ipsum lorum ipsum lorum ipsum lorum ipsum lorum ipsum lorum ipsum",
        softWrap: true,
      ),
    );
    return MaterialApp(
        title: 'Flutter layout Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("layout")),
          body: ListView(
            children: [
              Image.asset('images/lake.jpg',
                  width: 600, height: 240, fit: BoxFit.cover),
              titleSection,
              buttonSection,
              textSection
            ],
          ),
        ));
  }

  Column _buildButtomColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}
