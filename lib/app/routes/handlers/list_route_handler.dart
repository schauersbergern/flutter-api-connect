import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/dependencies/dependency_factory.dart';
import 'package:api_connector/app/ui/list/list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_handler/route_handler.dart';

class ListRouteHandler extends RouteHandler {
  ListRouteHandler(RouteSettings settings) : super(settings);

  @override
  Route getRoute(BuildContext context) => MaterialPageRoute(
    settings: settings,
    builder: (_) =>
        BlocProvider<ApiListBloc>(
          create: (_) => context.read<BlocCreator<ApiListBloc>>()?.call(context),
          child: ListPage(),
        )
  );
}