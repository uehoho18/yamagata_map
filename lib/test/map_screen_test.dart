import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yamagata_map/screens/map_screen.dart';
import 'package:yamagata_map/screens/map_screen/components/sign_in_button.dart';
import 'package:yamagata_map/screens/map_screen/components/sign_out_button.dart';

// FirebaseAuthとGeolocatorのモックを作成します。
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGeolocator extends Mock implements Geolocator {}

class MockUser extends Mock implements User {}

@GenerateMocks([], customMocks: [
  MockSpec<FirebaseAuth>(as: #MockFirebaseAuth),
  MockSpec<Geolocator>(as: #MockGeolocator),
])
void main() {
  // テストをグループ化します。
  group('MapScreen Widget Test', () {
    testWidgets('displays the SignInButton when the user is not signed in',
        (WidgetTester tester) async {
      // MockのFirebaseAuthをプロバイダにセットアップします。
      MockFirebaseAuth mockAuth = MockFirebaseAuth();

      when(mockAuth.authStateChanges()).thenAnswer((_) {
        return Stream<User>.empty();
      });

      // SignInButtonが表示されていることを確認します。
      expect(find.byType(SignInButton), findsOneWidget);
    });

    testWidgets('displays the SignOutButton when the user is signed in',
        (WidgetTester tester) async {
      // MockのFirebaseAuthをプロバイダにセットアップします。
      MockFirebaseAuth mockAuth = MockFirebaseAuth();
      MockUser mockUser = MockUser();

      when(mockAuth.authStateChanges()).thenAnswer((_) {
        return Stream<User>.value(mockUser);
      });

      // SignOutButtonが表示されていることを確認します。
      expect(find.byType(SignOutButton), findsOneWidget);
    });
  });
}
