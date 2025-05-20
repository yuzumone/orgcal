import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orgcal/data/model/preference_view_type.dart';
import 'package:orgcal/ui/preference/preference_view_state.dart';

class PreferenceView extends ConsumerWidget {
  const PreferenceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(preferenceViewStateNotifierProvider.notifier);
    final viewType = ref.watch(
      preferenceViewStateNotifierProvider.select((v) => v.viewType),
    );

    return PopScope(
      canPop: viewType == PreferenceViewType.main,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        notifier.setViewType(PreferenceViewType.main);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preference'),
          leading:
              viewType == PreferenceViewType.main
                  ? null
                  : IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      notifier.setViewType(PreferenceViewType.main);
                    },
                  ),
        ),
        body: Container(
          child:
              viewType == PreferenceViewType.main
                  ? MainPreferenceView()
                  : PreferenceInputView(),
        ),
      ),
    );
  }
}

Future<String?> _buildInputDialog(BuildContext context, String title) async {
  var result = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                onChanged: (value) => result = value,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(result),
            child: Text('OK'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: Text('CANCEL'),
          ),
        ],
      );
    },
  );
}

class MainPreferenceView extends ConsumerWidget {
  const MainPreferenceView({super.key});

  static const fontSize = [
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(preferenceViewStateNotifierProvider.notifier);

    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Org File'),
          subtitle: Text('OrgファイルのURL'),
          onTap: () {
            notifier.setViewType(PreferenceViewType.orgUrl);
          },
        ),
        ListTile(
          title: Text('TODO Keyword'),
          subtitle: Text('完了のTODOと認識するキーワード'),
          onTap: () {
            notifier.setViewType(PreferenceViewType.todo);
          },
        ),
        ListTile(
          title: Text('DONE Keyword'),
          subtitle: Text('未完了のTODOと認識するキーワード'),
          onTap: () {
            notifier.setViewType(PreferenceViewType.done);
          },
        ),
        ListTile(
          title: Text('Font size'),
          trailing: DropdownButton(
            value:
                ref
                    .watch(
                      preferenceViewStateNotifierProvider.select(
                        (v) => v.fontSize,
                      ),
                    )
                    .toString(),
            onChanged: (String? newValue) {
              if (newValue == null) return;
              notifier.setFontSize(int.parse(newValue));
            },
            items:
                fontSize
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(
                        value: e.toString(),
                        child: Text(e.toString()),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}

class PreferenceInputView extends ConsumerWidget {
  const PreferenceInputView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(preferenceViewStateNotifierProvider.notifier);
    final viewType = ref.watch(
      preferenceViewStateNotifierProvider.select((v) => v.viewType),
    );
    var items = <String>[];
    switch (viewType) {
      case PreferenceViewType.orgUrl:
        items = ref.watch(
          preferenceViewStateNotifierProvider.select((v) => v.urls),
        );
        break;
      case PreferenceViewType.todo:
        items = ref.watch(
          preferenceViewStateNotifierProvider.select((v) => v.todoKeywords),
        );
        break;
      case PreferenceViewType.done:
        items = ref.watch(
          preferenceViewStateNotifierProvider.select((v) => v.doneKeywords),
        );
        break;
      default:
        items = [];
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder:
            (BuildContext context, int index) => ListTile(
              title: Text(items[index]),
              onLongPress: () {
                switch (viewType) {
                  case PreferenceViewType.orgUrl:
                    notifier.setUrls(List.from(items)..removeAt(index));
                    break;
                  case PreferenceViewType.todo:
                    notifier.setTodoKeywords(List.from(items)..removeAt(index));
                    break;
                  case PreferenceViewType.done:
                    notifier.setDoneKeywords(List.from(items)..removeAt(index));
                    break;
                  default:
                    null;
                }
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await _buildInputDialog(context, 'Input File Url');
          if (result != null) {
            switch (viewType) {
              case PreferenceViewType.orgUrl:
                notifier.setUrls(List.from(items)..add(result));
                break;
              case PreferenceViewType.todo:
                notifier.setTodoKeywords(List.from(items)..add(result));
                break;
              case PreferenceViewType.done:
                notifier.setDoneKeywords(List.from(items)..add(result));
                break;
              default:
                null;
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
