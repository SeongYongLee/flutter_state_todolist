import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class State {
  String name;
  String route;
  String introduction;

  State(this.name, this.route, this.introduction);
}

final stateList = [
  State('Inherited Widget', 'widget', 'Inherited Widget 설명 하는 글'),
  State('BLOC Provider', 'bloc', 'BLOC 설명 하는 글'),
  State('Riverpod', 'riverpod', 'Riverpod 설명 하는 글'),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VMaterialApp(
      title: 'Welcome State TodoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('SELECT TODOLIST')),
        body: ListView.builder(
          itemCount: stateList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => context.vRouter.to(stateList[index].route),
                child: TodoCard(state: stateList[index]));
          },
        ),
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final State state;

  TodoCard({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${state.name}',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            Text('${state.introduction}',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
