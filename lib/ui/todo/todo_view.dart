import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orgcal/data/model/file.dart';
import 'package:orgcal/ui/detail/detail_view.dart';
import 'package:orgcal/ui/home/home_view_state.dart';
import 'package:org_parser/org_parser.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.files),
    );
    final todoKeywords = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.todoKeywords),
    );
    final todos = _getTodoList(files, todoKeywords);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder:
          (BuildContext context, int index) =>
              _buildListTile(context, todos[index]),
    );
  }

  List<Headline> _getTodoList(List<File> files, List<String> todoKeyword) {
    return files
        .expand((x) => x.org.headlines)
        .where((x) => (x.isTodo && todoKeyword.contains(x.keyword)))
        .toList();
  }

  Widget _buildListTile(BuildContext context, Headline headline) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(headline: headline),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          headline.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
