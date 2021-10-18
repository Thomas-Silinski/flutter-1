import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:project/controllers/article.dart';
import 'package:project/controllers/user.dart';
import 'package:project/models/article.dart';
import 'package:project/components/post.dart';
import 'package:project/models/user.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
    user = userController.currentUser;
    super.initState();
  }

  void submit(){
    user!.name = _textEditingController.text;
    setState(() {
      user!.name;
    });
    Navigator.of(context).pop(_textEditingController.text);
  }

  final ImagePicker picker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();
  final String? onChanged = '';
  final ButtonStyle styleButton =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16), fixedSize: const Size(150, 40), primary: const Color(0xFFF54B64),);

   void updateThumbnail(XFile? value) {
    if (value != null) {
      final File thumbnailFile = File(value.path);
      user!.updatePicture(thumbnailFile);
      setState(() {
        user!.picture;
      });
    }
  }

  logout() {
    userController.logout();
    Get.offAllNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Change username'),
                                content: TextField(
                                  controller: _textEditingController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => submit(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            user!.name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                        child:
                          Text(
                            user!.email,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                        child: ElevatedButton(
                          style: styleButton,
                          onPressed: () => (logout()),
                          child: const Text('Logout'),
                        ),
                      ),
                    ]
                  ),
                  const Spacer(
                  ),
                  Padding (
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        picker
                        .pickImage(source: ImageSource.gallery)
                        .then(updateThumbnail);
                      },
                      child: Image.memory(
                        user!.picture!,
                        fit: BoxFit.cover,
                        height: 75,
                      ),
                    )
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