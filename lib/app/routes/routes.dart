import 'package:flutter/material.dart';

import 'handlers/detail_route_handler.dart';
import 'handlers/list_route_handler.dart';

class Routes {
  static const home = 'home';
  static const apiList = '$home/list';
  static const apiDetail = '$apiList/detail';

  static Route onGenerateRoute(RouteSettings settings, BuildContext context) {
    var route = settings.name.split('?').first;

    if (route.startsWith('/')) {
      route = route.substring(1);
    }

    switch (route) {
      case apiDetail:
        return DetailRouteHandler(settings, settings.arguments).getRoute(context);
      default:
        return ListRouteHandler(settings).getRoute(context);
    }
  }
}