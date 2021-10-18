import 'package:flutter/material.dart';
import 'package:project/components/search_screen/search_bar.dart';

class SearchScreenHeader extends StatelessWidget {
  const SearchScreenHeader({
    Key? key,
    required this.onSearchChanged,
  }) : super(key: key);

  final void Function(String)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            'SEARCH',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SearchBarWidget(
            onChanged: onSearchChanged,
          ),
        ),
      ],
    );
  }
}
