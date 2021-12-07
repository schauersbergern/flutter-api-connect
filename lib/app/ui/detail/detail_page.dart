import 'package:api_connector/app/ui/list/model/cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'image_container.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key, this.cockTail}) : super(key: key);

  final CocktailListItem cockTail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(cockTail.name)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            _buildMain(context),
            _buildDetails(context)
          ],
        ));
  }

  Widget _buildBanner() {
    return Hero(
      tag: 'cardArtwork-${cockTail.id}',
      child: ImageContainer(
        height: 200,
        url: cockTail.image,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cockTail.name,
            style:
            Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 24),
          ),
          Text(
            cockTail.category,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    const style = TextStyle(fontSize: 16.0);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cockTail.ingredients,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          Text(
            cockTail.instructions,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

}
