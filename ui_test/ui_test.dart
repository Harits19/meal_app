import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:meal_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // group("Widget Test", () {
  //   testWidgets("description", (WidgetTester tester) async {
  //     app.main();
  //     await tester.pumpAndSettle();
  //   });
  // });

  group('MealPage', () {
    testWidgets('Add favorite on detail meal page',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      const menu = "Apple & Blackberry Crumble";

      // open detail add favorite
      final check1MenuFinder = find.text(menu);
      expect(check1MenuFinder, findsOneWidget);
      await tester.tap(check1MenuFinder);
      await tester.pumpAndSettle();

      final addFavorite = find.text("Add Favorite");
      await tester.tap(addFavorite);
      await tester.pageBack();
      await tester.pumpAndSettle();

      final listFavorite = find.text("List Favorites");
      await tester.tap(listFavorite);
      await tester.pumpAndSettle();

      final check2MenuFinder = find.text(menu);
      expect(check2MenuFinder, findsOneWidget);
    });
  });
}
