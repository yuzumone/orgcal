import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:org_parser_example/data/model/file.dart';
import 'package:org_parser_example/ui/detail/detail_view.dart';
import 'package:org_parser_example/ui/detail/detail_view_state.dart';
import 'package:org_parser_example/ui/home/home_view_state.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

class FilesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var files =
        context.select<HomeViewState, List<File>>((state) => state.files);
    var todoKeywords = context
        .select<HomeViewState, List<String>>((state) => state.todoKeywords);
    var doneKeywords = context
        .select<HomeViewState, List<String>>((state) => state.doneKeywords);
    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(files[index].name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _HeadlineListView(
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

class _HeadlineListView extends StatelessWidget {
  final String name;
  final OrgFile org;
  final List<String> todoKeywords;
  final List<String> doneKeywords;

  _HeadlineListView(
      {Key? key,
      required this.name,
      required this.org,
      required this.todoKeywords,
      required this.doneKeywords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: org.headlines.length,
          itemBuilder: (BuildContext context, int index) => _HeadlineView(
            headline: org.headlines[index],
            todoKeywords: todoKeywords,
            doneKeywords: doneKeywords,
          ),
        ),
      ),
    );
  }
}

class _HeadlineView extends StatelessWidget {
  final Headline headline;
  final List<String> todoKeywords;
  final List<String> doneKeywords;

  _HeadlineView(
      {Key? key,
      required this.headline,
      required this.todoKeywords,
      required this.doneKeywords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                StateNotifierProvider<DetailViewStateNotifier, DetailViewState>(
              create: (_) => DetailViewStateNotifier(),
              child: DetailView(headline: headline),
            ),
          ),
        );
      },
      child: Padding(
        padding:
            EdgeInsets.only(left: 8.0, right: 16.0, top: 16.0, bottom: 16.0),
        child: Container(
          padding: EdgeInsets.only(
            left: (8.0 * headline.level).toDouble(),
          ),
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
              SizedBox(
                height: 4.0,
              ),
              Visibility(
                visible: headline.scheduled != null,
                child: Text('Sheduled: ${headline.scheduled}'),
              ),
              SizedBox(
                height: 4.0,
              ),
              Visibility(
                visible: headline.deadline != null,
                child: Text('Deadline: ${headline.deadline}'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color? _getTextColor(BuildContext context, String? keyword,
      List<String> todos, List<String> dones) {
    if (todos.contains(keyword)) {
      return Colors.red;
    } else if (dones.contains(keyword)) {
      return Colors.green;
    } else {
      return Theme.of(context).textTheme.bodyText1!.color;
    }
  }
}
