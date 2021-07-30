import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

export 'list.dart';
export 'edit.dart';

class RiverpodWidgetBuilder extends StatelessWidget {
  final Widget child;

  const RiverpodWidgetBuilder(this.child);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: VMaterialApp(
        title: 'TODOLIST (Inherited Widget)',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        child: child,
      ),
    );
  }
}