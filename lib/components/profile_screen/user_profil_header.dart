import 'package:flutter/material.dart';
import 'package:project/components/profile_screen/change_name_modal.dart';
import 'package:project/components/profile_screen/user_profil_pic.dart';
import 'package:project/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/models/user.dart';

class UserProfilHeader extends StatelessWidget {
  const UserProfilHeader({
    Key? key,
    required this.onThumbnailUpdated,
    required this.user,
    required this.onLogoutPressed,
    required this.onChangeName,
    required this.nameTextController,
  }) : super(key: key);

  final void Function(XFile?) onThumbnailUpdated;
  final User? user;
  final void Function() onLogoutPressed;
  final void Function() onChangeName;
  final TextEditingController nameTextController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 15.0,
              ),
              child: InkWell(
                splashColor: kPrimaryGradient2.withOpacity(0.8),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => ChangeNameModal(
                      onSubmit: onChangeName,
                      textEditingController: nameTextController,
                    ),
                  );
                },
                child: Text(
                  user!.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 15.0,
              ),
              child: Text(
                user!.email,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 15.0,
              ),
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(
                        const Size(150, 40),
                      ),
                    ),
                onPressed: onLogoutPressed,
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 15.0,
          ),
          child: UserProfilPic(
            onThumbnailUpdated: onThumbnailUpdated,
            user: user,
          ),
        )
      ],
    );
  }
}
