import 'dart:ffi';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:random_kitties/provider/CatProvider.dart';
import 'package:random_kitties/model/glitch/glitch.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  runApp(MyApp());
}

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CatProvider>(CatProvider());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text("title"),
            ),
            body: CatGrid()));
  }
}

class CatGrid extends StatefulWidget {
  @override
  _CatGridState createState() => _CatGridState();
}

class _CatGridState extends State<CatGrid> with AfterLayoutMixin {
  final provider = getIt<CatProvider>();
  List<Widget> catPhotos = [];
  List<StaggeredTile> catPhotoTiles = [];
  @override
  void afterFirstLayout(BuildContext context) {
    provider.getTwentyRandomPhoto();

    provider.catPhotoStream.listen((snapshot) {
      snapshot.fold((l) {
        if (l is NoInternetGlitch) {
          // Color randomColor = Color.fromRGBO(Random().nextInt(255),
          //     Random().nextInt(255), Random().nextInt(255), 1);
          // catPhotos.add(CatPhotoErrorTile(randomColor, "Unable to Connect"));
        }
      },
          (r) => {
                catPhotos.add(CatPhotoTile(r.url)),
              });
      int count = Random().nextInt(4);
      catPhotoTiles.add(StaggeredTile.count(count, count.toDouble()));

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return catPhotos.length == 0
        ? Center(child: CircularProgressIndicator())
        : Center(
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => catPhotoTiles[index],
                itemCount: catPhotos.length,
                itemBuilder: (context, index) {
                  return catPhotos[index];
                }));
  }
}

class CatPhotoTile extends StatelessWidget {
  final String imageUrl;
  const CatPhotoTile(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Center(
          child: new Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ))),
    );
  }
}
