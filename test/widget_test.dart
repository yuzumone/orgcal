import 'package:flutter_test/flutter_test.dart';
import 'package:orgcal/data/repository/file_repository.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:orgcal/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('App widget test', (tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<FileRepository>(create: (_) => FileRepository()),
          Provider<PreferenceRepository>(create: (_) => PreferenceRepository()),
        ],
        child: MyApp(),
      ),
    );
  });
}
