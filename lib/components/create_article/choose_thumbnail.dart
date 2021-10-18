import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';

class ChooseThumbnail extends StatelessWidget {
  ChooseThumbnail({
    Key? key,
    required this.thumbnailFile,
    required this.updateThumbnail,
  }) : super(key: key);

  final Rx<File?> thumbnailFile;
  final ImagePicker picker = ImagePicker();
  final void Function(XFile? value) updateThumbnail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(
          text: 'Thumbnail',
          gradient: const LinearGradient(
            colors: <Color>[
              kPrimaryGradient1,
              kPrimaryGradient2,
            ],
          ),
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 16),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (thumbnailFile.value != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 200,
                  ),
                  child: Image.file(
                    thumbnailFile.value!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              Column(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: kPrimaryGradient2,
                    onPressed: () => picker
                        .pickImage(source: ImageSource.gallery)
                        .then(updateThumbnail),
                    tooltip: 'Pick thumbnail from gallery',
                    child: const Icon(Icons.photo),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: kPrimaryGradient2,
                    onPressed: () => picker
                        .pickImage(source: ImageSource.camera)
                        .then(updateThumbnail),
                    tooltip: 'Take a new picture',
                    child: const Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
