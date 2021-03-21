import 'package:flutter/material.dart';

class ComicsListItemWidget extends StatelessWidget {
  final String title;
  final String description;

  ComicsListItemWidget(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Image.asset(
            'assets/images/cover.jpeg',
            height: 185,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 16,
                    ),
                    child: Text(
                      "written by Jason Aaron",
                      softWrap: true,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Text(
                    description,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
