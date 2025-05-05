import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:intl/intl.dart';
import 'package:org_parser_example/data/model/file.dart';
import 'package:org_parser_example/ui/detail/detail_view.dart';
import 'package:org_parser_example/ui/detail/detail_view_state.dart';
import 'package:org_parser_example/ui/home/home_view_state.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

class AgendaView extends StatelessWidget {
  final format = DateFormat('EEEE\tdd\tMMM\ty');

  @override
  Widget build(BuildContext context) {
    var files =
        context.select<HomeViewState, List<File>>((state) => state.files);
    var todoKeywords = context
        .select<HomeViewState, List<String>>((state) => state.todoKeywords);
    var doneKeywords = context
        .select<HomeViewState, List<String>>((state) => state.doneKeywords);
    var weekDiff =
        context.select<HomeViewState, int>((state) => state.weekDiff);
    var now = DateTime.now();
    var basis = now.add(Duration(days: weekDiff * 7));
    var agenda = _getAgendaList(files, basis);
    var over = _getOvertimeAgendaList(files, basis, todoKeywords);
    var items = _createListItems(now, basis, agenda, over);
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildTile(context, items[index], todoKeywords, doneKeywords),
    );
  }

  List<Headline> _getAgendaList(List<File> files, DateTime basis) {
    var start =
        DateTime(basis.year, basis.month, basis.day - (basis.weekday - 1));
    var end =
        DateTime(basis.year, basis.month, basis.day + (8 - basis.weekday));
    var list = files
        .expand((x) => x.org.headlines)
        .where((x) => x.isTodo)
        .where((x) => x.scheduledDateTime != null)
        .where((x) =>
            start.isBefore(x.scheduledDateTime!) &&
            end.isAfter(x.scheduledDateTime!))
        .toList();
    list.sort((x, y) => x.scheduledDateTime!.compareTo(y.scheduledDateTime!));
    return list;
  }

  List<Headline> _getOvertimeAgendaList(
      List<File> files, DateTime now, List<String> todoKeywords) {
    var today = DateTime(now.year, now.month, now.day);
    var list = files
        .expand((x) => x.org.headlines)
        .where((x) => x.isTodo)
        .where((x) => todoKeywords.contains(x.keyword))
        .where((x) => x.scheduledDateTime != null)
        .where((x) => x.scheduledDateTime!.isBefore(today))
        .toList();
    list.sort((x, y) => x.scheduledDateTime!.compareTo(y.scheduledDateTime!));
    return list;
  }

  List<dynamic> _createListItems(DateTime now, DateTime basis,
      List<Headline> agendaList, List<Headline> overAgendaList) {
    var start = basis.subtract(Duration(days: now.weekday - 1));
    var dates = Iterable<int>.generate(7)
        .map((e) => DateTime(start.year, start.month, start.day + e))
        .toList();
    var items = <dynamic>[];
    dates.forEach((x) {
      items.add(x);
      var diff = now.difference(x);
      if (0 <= diff.inHours && diff.inHours < 24) {
        items.addAll(overAgendaList);
      }
      agendaList.forEach((y) {
        var diff = y.scheduledDateTime!.difference(x);
        if (0 <= diff.inHours && diff.inHours < 24) {
          items.add(y);
        }
      });
    });
    return items;
  }

  Widget _buildTile(BuildContext context, dynamic item,
      List<String> todoKeyword, List<String> doneKeyword) {
    if (item is DateTime) {
      return _buildHeaderTile(context, item);
    }
    return _buildListTile(context, item, todoKeyword, doneKeyword);
  }

  Widget _buildHeaderTile(BuildContext context, DateTime dateTime) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, top: 12.0, right: 16.0, bottom: 12.0),
      child: Text(
        format.format(dateTime),
        style: TextStyle(color: Colors.blue[700]),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Headline headline,
      List<String> todoKeyword, List<String> doneKeyword) {
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
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  headline.scheduled!,
                  style: TextStyle(
                    color: todoKeyword.contains(headline.keyword)
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  headline.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: todoKeyword.contains(headline.keyword)
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
