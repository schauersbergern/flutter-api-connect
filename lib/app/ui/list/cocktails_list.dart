import 'package:api_connector/app/bloc/api_list_bloc.dart';
import 'package:api_connector/app/routes/routes.dart';
import 'package:api_connector/app/ui/list/model/cocktail_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CocktailsList extends StatelessWidget {

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

  final List<CocktailListItem> items;

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

  Widget _buildRow(CocktailListItem cocktail, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(cocktail.name, style: const TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(cocktail.category),
        onTap: () {
          Navigator.of(context).pushNamed(Routes.apiDetail, arguments: cocktail);
        },
        trailing: Hero(
          tag: 'cardArtwork-${cocktail.id}',
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              cocktail.image,
            ),
          ),
        ),
      ),
    );
  }

}