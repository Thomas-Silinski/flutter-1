import 'package:flutter/material.dart';
import 'package:project/components/gradient_text.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/article.dart';

class ListPreviewArticles extends StatelessWidget {
  const ListPreviewArticles({
    Key? key,
    required this.listArticles,
    required this.title,
    required this.size,
  }) : super(key: key);

  final List<Article> listArticles;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: size,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listArticles.length,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: size,
                  child: _CardArticle(
                    title: listArticles[index].title,
                    imgUrl:
                        'https://www.japanfm.fr/wp-content/uploads/2021/03/Scissor-Seven-Saison-3-Date-de-sortie-et-a-quoi.jpg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardArticle extends StatelessWidget {
  const _CardArticle({
    Key? key,
    required this.title,
    required this.imgUrl,
  }) : super(key: key);

  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kDarkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
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
          // TODO(Melvyn): replace by image of article
          Image.network(
            imgUrl,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
