import 'package:flutter/material.dart';
import 'package:gowallpaper/data/data.dart';
import 'package:gowallpaper/models/categories_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<CategorieModel> categories = new List();

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }



  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    FutureBuilder getWallpaper(){
      return FutureBuilder(
            future: _getImage(context, 'kirby.jpg'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: snapshot.data);
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: CircularProgressIndicator());
              }
              return Container(child: Text('No image get'));
            },
          );
    }

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
          SizedBox(height: 16),
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
          Container(),
          Container(
              child: getWallpaper())
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

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
