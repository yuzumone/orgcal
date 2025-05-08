import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:orgcal/data/model/file.dart';
import 'package:orgcal/ui/agenda/agenda_view.dart';
import 'package:orgcal/ui/file/file_view.dart';
import 'package:orgcal/ui/home/home_view_state.dart';
import 'package:orgcal/ui/search/search_view.dart';
import 'package:orgcal/ui/search/search_view_state.dart';
import 'package:orgcal/ui/todo/todo_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Widget> _listWidgets = <Widget>[
    FilesView(),
    AgendaView(),
    TodoView(),
  ];

  @override
  Widget build(BuildContext context) {
    var pageIndex = context.select<HomeViewState, int>(
      (state) => state.pageIndex,
    );
    var files = context.select<HomeViewState, List<File>>(
      (state) => state.files,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Org Mobile'),
        actions: <Widget>[
          pageIndex == 1
              ? IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed:
                    () =>
                        context
                            .read<HomeViewStateNotifier>()
                            .subtractWeekDiff(),
              )
              : Container(),
          pageIndex == 1
              ? IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed:
                    () => context.read<HomeViewStateNotifier>().addWeekDiff(),
              )
              : Container(),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/preference'),
          ),
        ],
      ),
      body: Container(child: _listWidgets.elementAt(pageIndex)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        tooltip: 'Search',
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => StateNotifierProvider<
                      SearchViewStateNotifier,
                      SearchViewState
                    >(
                      create: (_) => SearchViewStateNotifier(),
                      child: SearchView(files: files),
                    ),
              ),
            ),
        child: Icon(Icons.search, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) => context.read<HomeViewStateNotifier>().setIndex(index),
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            label: 'Files',
            icon: Icon(Icons.insert_drive_file),
          ),
          BottomNavigationBarItem(
            label: 'Agenda',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(label: 'Todo', icon: Icon(Icons.alarm)),
        ],
      ),
    );
  }
}
