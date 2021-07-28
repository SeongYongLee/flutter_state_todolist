import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/page/home.dart';
import 'package:flutter_state_todolist/page/bloc/bloc.dart';
import 'package:flutter_state_todolist/page/inherited_widget/inherited_widget.dart';

void main() {
  runApp(
    VRouter(
      routes: [
        VWidget(
          path: '/',
          widget: HomePage(),
          stackedRoutes: [
            VNester(
              path: '/bloc',
              widgetBuilder: (child) => BlocPage(child),
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: BlocListPage(),
                  stackedRoutes: [
                    VWidget(path: 'edit/:index', widget: BlocEditPage())
                  ],
                ),
              ],
            ),
            VNester(
              path: '/widget',
              widgetBuilder: (child) => InheritedWidgetPage(child),
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: InheritedWidgetListPage(),
                  stackedRoutes: [
                    VWidget(path: 'edit/:index', widget: InheritedWidgetEditPage())
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}