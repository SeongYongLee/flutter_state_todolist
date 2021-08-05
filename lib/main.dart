import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import 'package:flutter_state_todolist/page/home.dart';
import 'package:flutter_state_todolist/page/bloc/widget_builder.dart';
import 'package:flutter_state_todolist/page/inherited_widget/widget_builder.dart';
import 'package:flutter_state_todolist/page/riverpod/widget_builder.dart';

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
              widgetBuilder: (child) {
                print('bloc builder');
                return BlocWidgetBuilder(child);
              },
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: BlocListPage(),
                  stackedRoutes: [
                    VWidget(path: 'new', widget: BlocEditPage()),
                    VWidget(path: 'edit/:index', widget: BlocEditPage())
                  ],
                ),
              ],
            ),
            VNester(
              path: '/widget',
              widgetBuilder: (child) {
                print('inherited builder');
                return InheritedWidgetBuilder(child);
              },
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: InheritedWidgetListPage(),
                  stackedRoutes: [
                    VWidget(path: 'new', widget: InheritedWidgetEditPage()),
                    VWidget(
                        path: 'edit/:index', widget: InheritedWidgetEditPage())
                  ],
                ),
              ],
            ),
            VNester(
              path: '/riverpod',
              widgetBuilder: (child) => RiverpodWidgetBuilder(child),
              nestedRoutes: [
                VWidget(
                  path: null,
                  widget: RiverpodListPage(),
                  stackedRoutes: [
                    VWidget(path: 'new', widget: RiverpodEditPage()),
                    VWidget(path: 'edit/:index', widget: RiverpodEditPage())
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
