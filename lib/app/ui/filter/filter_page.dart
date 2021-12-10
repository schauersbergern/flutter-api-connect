import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/config/constants.dart';
import 'package:api_connector/app/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_widget.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FilterState();
}

class FilterState extends State<FilterPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.filter),
        ),
        body: BlocBuilder<ApiListBloc, ApiListState>(
          bloc: context.read<ApiListBloc>(),
          builder: (context, state) {
            switch (state.runtimeType) {
              case ApiListIdle:
              case ApiListLoading:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ApiListLoaded:
                final casted = state as ApiListLoaded;
                return _Body(casted);
              case ApiLoadingError:
              default:
                final casted = state as ApiLoadingError;
                return Column(
                  children: [
                    Text('error, reason: $casted.reason'),
                  ],
                );
            }
          },
        ));
  }

  Widget _Body(ApiListLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        FilterWidget(
          value: Constants.filter1,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter1,
        ),
        FilterWidget(
          value: Constants.filter2,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter2,
        ),
        FilterWidget(
          value: Constants.filter3,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter3,
        ),
        FilterWidget(
          value: Constants.filter4,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter4,
        ),
        FilterWidget(
          value: Constants.filter5,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter5,
        ),
        FilterWidget(
          value: Constants.filter6,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter6,
        ),
        FilterWidget(
          value: Constants.filter7,
          groupValue: state.filterValue,
          onChanged: _handleRadioValueChange,
          text: Constants.filter7,
        ),
      ],
    );
  }
  void _handleRadioValueChange(String value) async {
    context.read<ApiListBloc>().add(FilterChanged(value ?? ""));
  }
}