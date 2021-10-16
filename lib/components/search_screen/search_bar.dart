import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20),
        hintText: 'Search...',
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        isDense: true,
      ),
    );
  }
}
