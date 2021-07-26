import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListCardShort extends StatelessWidget {
  final title;
  final titleColor;
  final text;

  const TodoListCardShort(
      {Key? key, this.title, this.titleColor, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: titleColor)),
        Expanded(
            child: Text(text,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.blueGrey))),
      ],
    );
  }
}
