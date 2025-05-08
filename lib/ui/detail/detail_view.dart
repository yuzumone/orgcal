import 'package:flutter/material.dart';
import 'package:orgcal/ui/detail/detail_view_state.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

class DetailView extends StatelessWidget {
  final Headline headline;

  const DetailView({super.key, required this.headline});

  @override
  Widget build(BuildContext context) {
    var fontFace = context.select<DetailViewState, String>(
      (state) => state.fontFace,
    );
    var fontSize = context.select<DetailViewState, int>(
      (state) => state.fontSize,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                headline.title,
                style: TextStyle(
                  fontSize: fontSize * 1.2,
                  fontFamily: fontFace,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Flexible(
              child: Text(
                headline.chunks.skip(1).join('\n'),
                style: TextStyle(
                  fontSize: fontSize.toDouble(),
                  fontFamily: fontFace,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
