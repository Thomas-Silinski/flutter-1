import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/profile_screen/user_profil_header.dart';
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
  final UserController _userController = Get.find<UserController>();
  final ArticleController _articleController = Get.find<ArticleController>();

  late User? _user;

  @override
  void initState() {
    _user = _userController.currentUser;
    super.initState();
  }

  void submit() {
    _user!.name = _textEditingController.text;
    setState(() {
      _user!.name;
    });
    Navigator.of(context).pop(_textEditingController.text);
  }

  final TextEditingController _textEditingController = TextEditingController();
  final String? onChanged = '';

  void updateThumbnail(XFile? value) {
    if (value != null) {
      final File thumbnailFile = File(value.path);
      _user!.updatePicture(thumbnailFile);
      setState(() {
        _user!.picture;
      });
    }
  }

  logout() {
    _userController.logout();
    Get.offAllNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserProfilHeader(
              onLogoutPressed: logout,
              onThumbnailUpdated: updateThumbnail,
              user: _user,
              nameTextController: _textEditingController,
              onChangeName: submit,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 15.0,
              ),
              child: Text(
                'Posted articles',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _articleController
                          .findByAuthor(_user!)
                          .map(
                            (Article a) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                NewsPost(
                                  title: a.title,
                                  subtitle: a.content,
                                  thumbnail: a.thumbnail,
                                  id: a.id,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
