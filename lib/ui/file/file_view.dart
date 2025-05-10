import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orgcal/ui/detail/detail_view.dart';
import 'package:orgcal/ui/home/home_view_state.dart';
import 'package:org_parser/org_parser.dart';

class FilesView extends ConsumerWidget {
  const FilesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.files),
    );
    final todoKeywords = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.todoKeywords),
    );
    final doneKeywords = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.doneKeywords),
    );

    return ListView.builder(
      itemCount: files.length,
      itemBuilder:
          (BuildContext context, int index) => ListTile(
            title: Text(files[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => HeadlineListView(
                        name: files[index].name,
                        org: files[index].org,
                        todoKeywords: todoKeywords,
                        doneKeywords: doneKeywords,
                      ),
                ),
              );
            },
          ),
    );
  }
}

class HeadlineListView extends StatelessWidget {
  final String name;
  final OrgFile org;
  final List<String> todoKeywords;
  final List<String> doneKeywords;

  const HeadlineListView({
    super.key,
    required this.name,
    required this.org,
    required this.todoKeywords,
    required this.doneKeywords,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: ListView.builder(
        itemCount: org.headlines.length,
        itemBuilder:
            (BuildContext context, int index) => HeadlineView(
              headline: org.headlines[index],
              todoKeywords: todoKeywords,
              doneKeywords: doneKeywords,
            ),
      ),
    );
  }
}

class HeadlineView extends StatelessWidget {
  final Headline headline;
  final List<String> todoKeywords;
  final List<String> doneKeywords;

  const HeadlineView({
    super.key,
    required this.headline,
    required this.todoKeywords,
    required this.doneKeywords,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(headline: headline),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 8.0,
          right: 16.0,
          top: 16.0,
          bottom: 16.0,
        ),
        child: Container(
          padding: EdgeInsets.only(left: (8.0 * headline.level).toDouble()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                headline.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: _getTextColor(
                    context,
                    headline.keyword,
                    todoKeywords,
                    doneKeywords,
                  ),
                ),
              ),
              SizedBox(height: 4.0),
              Visibility(
                visible: headline.scheduled != null,
                child: Text('Sheduled: ${headline.scheduled}'),
              ),
              SizedBox(height: 4.0),
              Visibility(
                visible: headline.deadline != null,
                child: Text('Deadline: ${headline.deadline}'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color? _getTextColor(
    BuildContext context,
    String? keyword,
    List<String> todos,
    List<String> dones,
  ) {
    if (todos.contains(keyword)) {
      return Colors.red;
    } else if (dones.contains(keyword)) {
      return Colors.green;
    } else {
      return Theme.of(context).textTheme.bodyLarge?.color;
    }
  }
}
