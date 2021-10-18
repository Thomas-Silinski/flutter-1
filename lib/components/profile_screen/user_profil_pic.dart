import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/user.dart';

class UserProfilPic extends StatelessWidget {
  UserProfilPic({
    Key? key,
    required this.user,
    required this.onThumbnailUpdated
  }) : super(key: key);

  final User? user;
  final ImagePicker picker = ImagePicker();
  final void Function(XFile? value) onThumbnailUpdated;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kPrimaryGradient2.withOpacity(0.8),
      onTap: () {
        picker.pickImage(source: ImageSource.gallery).then(onThumbnailUpdated);
      },
      child: user!.picture != null
          ? Image.memory(
              user!.picture!,
              fit: BoxFit.cover,
              height: 75,
            )
          : SizedBox(
              height: 50,
              width: 50,
              child: SvgPicture.asset('assets/profil.svg'),
            ),
    );
  }
}
