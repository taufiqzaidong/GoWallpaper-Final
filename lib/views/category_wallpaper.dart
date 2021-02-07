import 'package:flutter/material.dart';
import 'package:gowallpaper/bloc/theme.dart';
import 'package:gowallpaper/widgets/title_appbar.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: titleAppBar('Go', 'Wallpaper'),
           leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple[400],
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
        ),
      ),
    );
  }
}
