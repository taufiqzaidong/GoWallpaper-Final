import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gowallpaper/data/data.dart';
import 'package:gowallpaper/models/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<CategorieModel> categories = new List();

  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('imageURLs');
  final databaseReference = FirebaseFirestore.instance;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoriesTile(
                  title: categories[index].categorieName,
                  imgUrl: categories[index].imgUrl,
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: wallpapersList != null
                  ? new StaggeredGridView.countBuilder(
                      padding: const EdgeInsets.all(8.0),
                      crossAxisCount: 4,
                      itemCount: wallpapersList.length,
                      itemBuilder: (context, i) {
                        String imgPath = wallpapersList[i].get('url');
                        return new Material(
                          elevation: 8.0,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(8.0)),
                          child: new InkWell(
                            onTap: () {},
                            child: new Hero(
                              tag: imgPath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: FadeInImage.memoryNetwork(
                                  image: imgPath,
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (i) =>
                          new StaggeredTile.count(2, i.isEven ? 2 : 3),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    )
                  : new Center(
                      child: new CircularProgressIndicator(),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;

  CategoriesTile({@required this.imgUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          ClipRRect(
              child: Image.network(imgUrl,
                  height: 50, width: 100, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8)),
          Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(title,
                style: TextStyle(color: Colors.white, fontFamily: 'Bebas')),
          )
        ],
      ),
    );
  }
}
