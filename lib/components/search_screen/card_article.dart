import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/routes.dart';

class CardArticle extends StatelessWidget {
  const CardArticle({
    Key? key,
    required this.title,
    required this.imgBytes,
    required this.id,
  }) : super(key: key);

  final String title;
  final Uint8List imgBytes;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(articleRoute, parameters: <String, String>{'id': id}),
      child: Card(
        color: kDarkGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GradientText(
                text: title,
                gradient: const LinearGradient(
                  colors: <Color>[
                    kPrimaryGradient1,
                    kPrimaryGradient2,
                  ],
                ),
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.memory(
                  imgBytes,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
