import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cocktails_list.dart';


class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiListBloc>(context).add(FetchListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO
        title: Text('CockTails'),
      ),
      body: CocktailsList()
    );
  }


}
