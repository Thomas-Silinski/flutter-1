import 'package:flutter/material.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';

class CreateArticleContain extends StatelessWidget {
  const CreateArticleContain({
    Key? key,
    required this.updateContent,
  }) : super(key: key);

  final void Function(String)? updateContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(
          text: 'Content',
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
          onChanged: updateContent,
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          decoration: const InputDecoration(
            hintText: 'Your post content',
            contentPadding: EdgeInsets.all(20),
          ),
        )
      ],
    );
  }
}
