import 'package:api_connector/app/base/base_classes.dart';
import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/network/api_network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_services/http_services.dart';
import 'package:provider/src/provider.dart';

typedef BlocCreator<T> = T Function(BuildContext context);

abstract class BaseDependencyFactory {
  Dio createDio(BuildContext context);
  NetworkService createNetworkService(BuildContext context);
  BlocCreator<ApiListBloc> get apiListBlocCreator;
}

class DependencyFactory extends BaseDependencyFactory {
  @override
  Dio createDio(BuildContext _) {
    return Dio(
      BaseOptions(
        //TODO: URL
          baseUrl: "https://www.thecocktaildb.com", contentType: 'application/json'),
    );
  }

  @override
  NetworkService createNetworkService(BuildContext context) {
    return NetworkService(context.read<Dio>());
  }


  @override
  BlocCreator<ApiListBloc> get apiListBlocCreator =>
          (BuildContext context) => ApiListBloc(context.read<NetworkService>());

}