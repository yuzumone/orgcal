import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:org_parser/org_parser.dart';
import 'package:orgcal/data/model/file.dart';
import 'package:orgcal/ui/detail/detail_view.dart';
import 'package:orgcal/ui/detail/detail_view_state.dart';
import 'package:orgcal/ui/search/search_view_state.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  final List<File> files;

  const SearchView({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    var headlines = files.map((e) => e.org.headlines).expand((e) => e).toList();
    var result = context.select<SearchViewState, List<Headline>>(
      (state) => state.result,
    );
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          onSubmitted:
              (value) => context.read<SearchViewStateNotifier>().setResult(
                headlines.where((e) => e.raw.contains(value)).toList(),
              ),
        ),
      ),
      body: ListView.builder(
        itemCount: result.length,
        itemBuilder:
            (BuildContext context, int index) => ListTile(
              contentPadding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                bottom: 8.0,
              ),
              title: Text(result[index].chunks.first),
              subtitle: Text(
                result[index].chunks.skip(1).join('\n'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => StateNotifierProvider<
                            DetailViewStateNotifier,
                            DetailViewState
                          >(
                            create: (_) => DetailViewStateNotifier(),
                            child: DetailView(headline: result[index]),
                          ),
                    ),
                  ),
            ),
      ),
    );
  }
}
