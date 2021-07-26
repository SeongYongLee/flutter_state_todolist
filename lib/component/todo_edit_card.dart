import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoEditCard extends StatelessWidget {
  final String title;
  final StringBuffer buf;
  final int flex;
  late final TextEditingController _controller;

  TodoEditCard({Key? key, required this.title, required this.buf, required this.flex})
      : super(key: key){
    _controller = TextEditingController(text: buf.toString());
    _controller.addListener(() {
      buf.clear();
      buf.write(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLines: 100,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: title,
              ),
              controller: _controller,
            )
        )
    );
  }
}