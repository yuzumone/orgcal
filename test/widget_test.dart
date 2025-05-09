import 'package:flutter_test/flutter_test.dart';
import 'package:orgcal/data/repository/file_repository.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:orgcal/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

void main() {
  group('SharedPreferences saveLocale', () {
    setUpAll(() async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
    });
    testWidgets('App widget test', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<FileRepository>(create: (_) => FileRepository()),
            Provider<PreferenceRepository>(
              create: (_) => PreferenceRepository(),
            ),
          ],
          child: MyApp(),
        ),
      );
    });
  });
}
