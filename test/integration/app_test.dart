import 'package:flutter_test/flutter_test.dart';
import 'package:tourism_app/mocks/mock_location.dart';
import 'package:tourism_app/app.dart';
import 'package:image_test_utils/image_test_utils.dart';


void main() {
  testWidgets('test app startup', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(App());

      final mockLocation = MockLocation.fetchAny();

      expect(find.text(mockLocation.name), findsOneWidget);
      expect(find.text('${mockLocation.name}blah'), findsNothing);
    });
  });
}