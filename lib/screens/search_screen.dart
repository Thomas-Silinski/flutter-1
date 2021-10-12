import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/search_bar.dart';
import 'package:project/controllers/article.dart';

class SearchScreen extends GetView<ArticleController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  'SEARCH',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SearchBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
