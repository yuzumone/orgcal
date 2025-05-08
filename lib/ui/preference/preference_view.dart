import 'package:flutter/material.dart';
import 'package:orgcal/data/model/preference_view_type.dart';
import 'package:orgcal/ui/preference/preference_view_state.dart';
import 'package:provider/provider.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewType = context.select<PreferenceViewState, PreferenceViewType>(
      (state) => state.viewType,
    );
    var preferenceViewStateNotifier =
        context.read<PreferenceViewStateNotifier>();
    return PopScope(
      canPop: viewType == PreferenceViewType.main,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        preferenceViewStateNotifier.setViewType(PreferenceViewType.main);
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
                      context.read<PreferenceViewStateNotifier>().setViewType(
                        PreferenceViewType.main,
                      );
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

class MainPreferenceView extends StatelessWidget {
  const MainPreferenceView({super.key});

  static const fontFaces = ['Myrica', 'Cica', 'SourceHanCodeJP', 'HackGen'];
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
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Org File'),
          subtitle: Text('OrgファイルのURL'),
          onTap: () {
            context.read<PreferenceViewStateNotifier>().setViewType(
              PreferenceViewType.orgUrl,
            );
          },
        ),
        ListTile(
          title: Text('TODO Keyword'),
          subtitle: Text('完了のTODOと認識するキーワード'),
          onTap: () {
            context.read<PreferenceViewStateNotifier>().setViewType(
              PreferenceViewType.todo,
            );
          },
        ),
        ListTile(
          title: Text('DONE Keyword'),
          subtitle: Text('未完了のTODOと認識するキーワード'),
          onTap: () {
            context.read<PreferenceViewStateNotifier>().setViewType(
              PreferenceViewType.done,
            );
          },
        ),
        ListTile(
          title: Text('Font face'),
          trailing: DropdownButton(
            value: context.select<PreferenceViewState, String>(
              (state) => state.fontFace,
            ),
            onChanged: (String? newValue) {
              if (newValue == null) return;
              context.read<PreferenceViewStateNotifier>().setFontFace(newValue);
            },
            items:
                fontFaces
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
          ),
        ),
        ListTile(
          title: Text('Font size'),
          trailing: DropdownButton(
            value:
                context
                    .select<PreferenceViewState, int>((state) => state.fontSize)
                    .toString(),
            onChanged: (String? newValue) {
              if (newValue == null) return;
              context.read<PreferenceViewStateNotifier>().setFontSize(
                int.parse(newValue),
              );
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

class PreferenceInputView extends StatelessWidget {
  const PreferenceInputView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewType = context.select<PreferenceViewState, PreferenceViewType>(
      (state) => state.viewType,
    );
    var preferenceViewStateNotifier =
        context.read<PreferenceViewStateNotifier>();
    var items = <String>[];
    switch (viewType) {
      case PreferenceViewType.orgUrl:
        items = context.select<PreferenceViewState, List<String>>(
          (state) => state.urls,
        );
        break;
      case PreferenceViewType.todo:
        items = context.select<PreferenceViewState, List<String>>(
          (state) => state.todoKeywords,
        );
        break;
      case PreferenceViewType.done:
        items = context.select<PreferenceViewState, List<String>>(
          (state) => state.doneKeywords,
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
                    preferenceViewStateNotifier.setUrls(
                      List.from(items)..removeAt(index),
                    );
                    break;
                  case PreferenceViewType.todo:
                    preferenceViewStateNotifier.setTodoKeywords(
                      List.from(items)..removeAt(index),
                    );
                    break;
                  case PreferenceViewType.done:
                    preferenceViewStateNotifier.setDoneKeywords(
                      List.from(items)..removeAt(index),
                    );
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
                preferenceViewStateNotifier.setUrls(
                  List.from(items)..add(result),
                );
                break;
              case PreferenceViewType.todo:
                preferenceViewStateNotifier.setTodoKeywords(
                  List.from(items)..add(result),
                );
                break;
              case PreferenceViewType.done:
                preferenceViewStateNotifier.setDoneKeywords(
                  List.from(items)..add(result),
                );
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
