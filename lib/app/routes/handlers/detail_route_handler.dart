import 'package:api_connector/app/base/base_classes.dart';
import 'package:api_connector/app/ui/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:route_handler/route_handler.dart';

class DetailRouteHandler extends RouteHandler<ApiListItem> {
  DetailRouteHandler(RouteSettings settings, ApiListItem model)
      : super(settings, arguments: model);

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => DetailPage(listItem: arguments),
    );
  }
}