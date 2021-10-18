import 'package:flutter/material.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';

class CreateArticleHeader extends StatelessWidget {
  const CreateArticleHeader({
    Key? key,
    required this.updateHeadline,
  }) : super(key: key);

  final void Function(String)? updateHeadline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(
          text: 'Headline',
          gradient: const LinearGradient(
            colors: <Color>[
              kPrimaryGradient1,
              kPrimaryGradient2,
            ],
          ),
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(height: 16),
        TextField(
          onChanged: updateHeadline,
          decoration: const InputDecoration(
            hintText: 'Your post title',
          ),
        ),
      ],
    );
  }
}
