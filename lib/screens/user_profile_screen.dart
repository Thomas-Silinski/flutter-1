import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/article.dart';
import 'package:project/components/post.dart';
import 'package:project/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController userController = Get.find<UserController>();
  final ArticleController articleController = Get.find<ArticleController>();
  late User? user;
  late Iterable<Article> articles;

  @override
  void initState() {
    user = userController.find(widget.id);
    super.initState();
  }
  final ButtonStyle styleButton =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16), fixedSize: const Size(150, 40), primary: const Color(0xFFF54B64),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Text(
                      user!.name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const Spacer(
                  ),
                  Padding (
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: Image.memory(
                      user!.picture!,
                      fit: BoxFit.cover,
                      height: 75,
                      width: 75,
                    ),
                  )
                ],
            ),
            Row(
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                  child: Text(
                    'Posted articles',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
            Expanded (
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget> [
                    Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: articleController.findByAuthor(user!)
                        .map(
                          (Article a) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              NewsPost(title: a.title, subtitle: a.content, thumbnail: a.thumbnail, id: a.id,),
                            ],
                          ),
                        )
                        .toList(),
                    ),
                  ),
                ],)
            ),
          ],
        ),
      ),
    );
  }
}