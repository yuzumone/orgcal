import 'package:flutter/material.dart';
import 'package:orgcal/data/model/preference_view_type.dart';
import 'package:orgcal/ui/preference/preference_view_state.dart';
import 'package:provider/provider.dart';

class PreferenceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewType = context.select<PreferenceViewState, PreferenceViewType>(
      (state) => state.viewType,
    );
    return WillPopScope(
      onWillPop: () async {
        if (viewType == PreferenceViewType.main) {
          Navigator.of(context).pop();
        } else {
          context.read<PreferenceViewStateNotifier>().setViewType(
            PreferenceViewType.main,
          );
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preference'),
          leading:
              viewType == PreferenceViewType.main
                  ? null
                  : IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
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
                  ? _MainPreferenceView()
                  : _PreferenceInputView(),
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

class _MainPreferenceView extends StatelessWidget {
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
    return Container(
      child: ListView(
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
                context.read<PreferenceViewStateNotifier>().setFontFace(
                  newValue,
                );
              },
              items:
                  fontFaces
                      .map<DropdownMenuItem<String>>(
                        (e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)),
                      )
                      .toList(),
            ),
          ),
          ListTile(
            title: Text('Font size'),
            trailing: DropdownButton(
              value:
                  context
                      .select<PreferenceViewState, int>(
                        (state) => state.fontSize,
                      )
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
      ),
    );
  }
}

class _PreferenceInputView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _viewType = context.select<PreferenceViewState, PreferenceViewType>(
      (state) => state.viewType,
    );
    var _items = <String>[];
    switch (_viewType) {
      case PreferenceViewType.orgUrl:
        _items = context.select<PreferenceViewState, List<String>>(
          (state) => state.urls,
        );
        break;
      case PreferenceViewType.todo:
        _items = context.select<PreferenceViewState, List<String>>(
          (state) => state.todoKeywords,
        );
        break;
      case PreferenceViewType.done:
        _items = context.select<PreferenceViewState, List<String>>(
          (state) => state.doneKeywords,
        );
        break;
      default:
        _items = [];
    }
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder:
              (BuildContext context, int index) => ListTile(
                title: Text(_items[index]),
                onLongPress: () {
                  switch (_viewType) {
                    case PreferenceViewType.orgUrl:
                      context.read<PreferenceViewStateNotifier>().setUrls(
                        List.from(_items)..removeAt(index),
                      );
                      break;
                    case PreferenceViewType.todo:
                      context
                          .read<PreferenceViewStateNotifier>()
                          .setTodoKeywords(List.from(_items)..removeAt(index));
                      break;
                    case PreferenceViewType.done:
                      context
                          .read<PreferenceViewStateNotifier>()
                          .setDoneKeywords(List.from(_items)..removeAt(index));
                      break;
                    default:
                      null;
                  }
                },
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await _buildInputDialog(context, 'Input File Url');
          if (result != null) {
            switch (_viewType) {
              case PreferenceViewType.orgUrl:
                context.read<PreferenceViewStateNotifier>().setUrls(
                  List.from(_items)..add(result),
                );
                break;
              case PreferenceViewType.todo:
                context.read<PreferenceViewStateNotifier>().setTodoKeywords(
                  List.from(_items)..add(result),
                );
                break;
              case PreferenceViewType.done:
                context.read<PreferenceViewStateNotifier>().setDoneKeywords(
                  List.from(_items)..add(result),
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
