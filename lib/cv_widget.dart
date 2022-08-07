import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';

import '../success.dart';

class CVWidget extends StatelessWidget {
  const CVWidget({
    required this.data,
    required this.index,
  });

  final SuccessData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5),
      child: ExpansionTileCard(
        expandedColor: Theme.of(context).backgroundColor,
        elevation: 4,
        key: key,
        trailing: Icon(
          Icons.expand_more,
          color: Theme.of(context).focusColor,
        ),
        leading: Icon(
          Icons.label_important,
          color: Theme.of(context).focusColor,
        ),
        title: Text(data.title,
            overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 2),
        baseColor: Theme.of(context).backgroundColor,
        expandedTextColor: Theme.of(context).textTheme.bodyMedium!.color,
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Timestamp: ',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  TextSpan(
                    style:
                        new TextStyle(color: Theme.of(context).indicatorColor),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        final dt = new DateTime.fromMillisecondsSinceEpoch(
                            data.timestamp * 1000);
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        final String formatted = formatter.format(dt);
                        showToast(
                          formatted.toString(),
                          context: context,
                          position: StyledToastPosition.top,
                        );
                      },
                    text: data.timestamp.toString(),
                  ),
                  TextSpan(
                    text: '\n\n${data.description}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: List.generate(
                  data.tags?.length ?? 0,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).indicatorColor,
                              borderRadius: BorderRadius.circular(30)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Text(
                            "#${data.tags![index]}",
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(
                                    color: Theme.of(context).cardColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
