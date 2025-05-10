import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orgcal/data/model/file.dart';
import 'package:orgcal/ui/detail/detail_view.dart';
import 'package:orgcal/ui/search/search_view_state.dart';

class SearchView extends ConsumerWidget {
  final List<File> files;

  const SearchView({super.key, required this.files});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headlines =
        files.map((e) => e.org.headlines).expand((e) => e).toList();
    final notifier = ref.read(searchViewStateNotifierProvider.notifier);
    final result = ref.watch(
      searchViewStateNotifierProvider.select((v) => v.result),
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
              (value) => notifier.setResult(
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
                          (BuildContext context) =>
                              DetailView(headline: result[index]),
                      // builder:
                      //     (context) => StateNotifierProvider<
                      //       DetailViewStateNotifier,
                      //       DetailViewState
                      //     >(
                      //       create: (_) => DetailViewStateNotifier(),
                      //       child: DetailView(headline: result[index]),
                      //     ),
                    ),
                  ),
            ),
      ),
    );
  }
}
