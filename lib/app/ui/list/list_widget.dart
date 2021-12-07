import 'package:api_connector/app/base/base_classes.dart';
import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiListBloc, ApiListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ApiListIdle:
          case ApiListLoading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ApiListLoaded:
            final casted = state as ApiListLoaded;
            return _Body(items: casted.items);
          case ApiLoadingError:
          default:
            final casted = state as ApiLoadingError;
            return Column(
              children: [
                Text(
                    'error, reason: $casted.reason'
                ),
              ],
            );
        }
      },
    );
  }
}

class _Body extends StatelessWidget{

  final List<ApiListItem> items;

  const _Body({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int position) {
          return _buildRow(items[position], context);
        });
  }

  Widget _buildRow(ApiListItem listItem, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(listItem.title, style: const TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(listItem.subtitle),
        onTap: () {
          Navigator.of(context).pushNamed(Routes.apiDetail, arguments: listItem);
        },
        trailing: Hero(
          tag: 'cardArtwork-${listItem.id}',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              listItem.image,
            ),
          ),
        ),
      ),
    );
  }

}