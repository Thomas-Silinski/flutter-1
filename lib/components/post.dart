import 'package:flutter/material.dart';


/// This is the stateful widget that the main application instantiates.
class NewsTitle extends StatefulWidget {
  const NewsTitle({Key? key}) : super(key: key);


  State<NewsTitle> createState() => _NewsTitleState();
}

/// This is the private State class that goes with NewsTitle.
class _NewsTitleState extends State<NewsTitle> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle styleButton =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'NEWS PAGE',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(width: 100),
          ElevatedButton(
            style: styleButton,
            onPressed: () {},
            child: const Text('+  Create Article'),
          ),
        ],
    );
  }
}

class NewsPost extends StatefulWidget {
  const NewsPost({Key? key}) : super(key: key);

  @override
  State<NewsPost> createState() => _NewsPostState();
}

/// https://medium.com/dlt-labs-publication/how-to-build-a-flutter-card-list-in-less-than-10-minutes-9839f79a6c08
class _NewsPostState extends State<NewsPost> {
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CustomListItemTwo(
            thumbnail: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            title: 'Flutter 1.0 Launch',
            subtitle: 'Flutter continues to improve and expand its horizons. This text should max out at two lines and clip',
          ),
        ],
      ),
    );
  }
}

// children: List.generate(10, (index) {
//   return Center(
//     child: Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: <Widget>[
//           CustomListItemTwo(
//             thumbnail: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
//             title: 'Flutter 1.0 Launch',
//             subtitle: 'Flutter continues to improve and expand its horizons. This text should max out at two lines and clip',
//           ),
//         ],
//       ),
//     ),
//   );
// }),


class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: SizedBox(
        height: 100,
        child: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(thumbnail),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
