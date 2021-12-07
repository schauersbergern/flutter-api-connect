import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/network/api_network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_factory.dart';

class DependencyProvider extends StatelessWidget {
  final Widget child;
  final BaseDependencyFactory dependencyFactory;

  const DependencyProvider({
    Key key,
    this.child,
    this.dependencyFactory,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: dependencyFactory.createDio),
        RepositoryProvider<NetworkService>(
          create: dependencyFactory.createNetworkService,
        ),
        RepositoryProvider<BlocCreator<ApiListBloc>>(
          create: (_) => dependencyFactory.apiListBlocCreator,
        ),
      ],
      child: Builder(
        builder: (context) => child,
      ),
    );
  }
}