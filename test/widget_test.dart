import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orgcal/data/repository/file_repository.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:orgcal/main.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';

class MockFileRepository extends Mock implements FileRepository {}

class MockPreferenceRepository extends Mock implements PreferenceRepository {}

void main() {
  group('Widget tests', () {
    setUpAll(() async {
      SharedPreferencesAsyncPlatform.instance =
          InMemorySharedPreferencesAsync.empty();
    });

    testWidgets('App widget test', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            fileRepositoryProvider.overrideWith((ref) {
              final mock = MockFileRepository();
              when(() => mock.getWebFiles([], [])).thenAnswer((_) async => []);
              return mock;
            }),
            preferenceRepositoryProvider.overrideWith((ref) {
              final mock = MockPreferenceRepository();
              when(
                () => mock.getPreference(),
              ).thenAnswer((_) async => Preference([], [], [], 16));
              return mock;
            }),
          ],
          child: MyApp(),
        ),
      );
    });
  });
}
