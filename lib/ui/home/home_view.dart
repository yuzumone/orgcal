import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orgcal/ui/agenda/agenda_view.dart';
import 'package:orgcal/ui/file/file_view.dart';
import 'package:orgcal/ui/home/home_view_state.dart';
import 'package:orgcal/ui/search/search_view.dart';
import 'package:orgcal/ui/todo/todo_view.dart';

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  final List<Widget> _listWidgets = <Widget>[
    FilesView(),
    AgendaView(),
    TodoView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeViewStateNotifierProvider.notifier);
    final pageIndex = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.pageIndex),
    );
    final files = ref.watch(
      homeViewStateNotifierProvider.select((v) => v.files),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Org Mobile'),
        actions: <Widget>[
          pageIndex == 1
              ? IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => notifier.subtractWeekDiff(),
              )
              : Container(),
          pageIndex == 1
              ? IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => notifier.addWeekDiff(),
              )
              : Container(),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/preference'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: _listWidgets.elementAt(pageIndex),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        tooltip: 'Search',
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SearchView(files: files),
                // builder:
                //     (context) => StateNotifierProvider<
                //       SearchViewStateNotifier,
                //       SearchViewState
                //     >(
                //       create: (_) => SearchViewStateNotifier(),
                //       child: SearchView(files: files),
                //     ),
              ),
            ),
        child: Icon(Icons.search, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) => notifier.setIndex(index),
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
