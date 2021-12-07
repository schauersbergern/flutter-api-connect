import 'package:api_connector/app/ui/detail/detail_page.dart';
import 'package:api_connector/app/ui/list/model/cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:route_handler/route_handler.dart';

class DetailRouteHandler extends RouteHandler<CocktailListItem> {
  DetailRouteHandler(RouteSettings settings, CocktailListItem model)
      : super(settings, arguments: model);

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => DetailPage(cockTail: arguments),
    );
  }
}