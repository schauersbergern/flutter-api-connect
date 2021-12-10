import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/config/constants.dart';
import 'package:api_connector/app/config/strings.dart';
import 'package:api_connector/app/ui/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_widget.dart';


class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiListBloc>(context).add(FetchListEvent(Constants.filter1));
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text(Strings.appTitle),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<ApiListBloc>(context),
                          child: FilterPage(),
                        )
                      ),
                    );
                  }
              )
            ],
          ),
          body: ListWidget()
      );
  }

}
