import 'package:flutter/material.dart';

class ComicsListItemWidget extends StatelessWidget {
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
                    "Avengers #39",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "written by Jason Aaron",
                    softWrap: true,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    "ENTER THE PHOENIX PROLOGUE! In the harsh, primordial world of One Million B.C.E., early humans who are different are left in the Burnt Place to die.",
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
