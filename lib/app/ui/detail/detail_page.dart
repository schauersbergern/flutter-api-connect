import 'package:api_connector/app/base/base_classes.dart';
import 'package:flutter/material.dart';
import 'image_container.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key, this.listItem}) : super(key: key);

  final ApiListItem listItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(listItem.title)),
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
      tag: 'cardArtwork-${listItem.id}',
      child: ImageContainer(
        height: 200,
        url: listItem.image,
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
            listItem.title,
            style:
            Theme.of(context).textTheme.headline1?.copyWith(fontSize: 24),
          ),
          Text(
            listItem.subtitle,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            listItem.detailText,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }

}
