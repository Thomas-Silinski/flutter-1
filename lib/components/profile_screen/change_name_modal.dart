import 'package:flutter/material.dart';

class ChangeNameModal extends StatelessWidget {
  const ChangeNameModal({
    Key? key,
    required this.textEditingController,
    required this.onSubmit,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change username'),
      content: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSubmit,
          child: const Text('Change'),
        ),
      ],
    );
  }
}
