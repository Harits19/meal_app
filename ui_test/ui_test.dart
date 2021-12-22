import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:meal_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const menu = "Apam balik";

  group(
    'MealPage',
    () {
      testWidgets(
        'Flow Add Favorite',
        (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          final check1Menu = find.text(menu);
          expect(check1Menu, findsOneWidget);
          await tester.tap(check1Menu);
          await tester.pumpAndSettle();

          final check2Menu = find.text(menu);
          expect(check2Menu, findsOneWidget);

          final addFavorite = find.text("Add Favorite");
          expect(addFavorite, findsOneWidget);

          await tester.tap(addFavorite);
          await tester.pumpAndSettle();
          await tester.pageBack();
          await tester.pumpAndSettle();

          final listFavorite = find.text("List Favorites");
          expect(listFavorite, findsOneWidget);
          await tester.tap(listFavorite);
          final check3Menu = find.text(menu);
          expect(check3Menu, findsOneWidget);
        },
      );
    },
  );

  group(
    "MealPage",
    () {
      testWidgets(
        'Flow Delete Favorite',
        (WidgetTester tester) async {
          app.main();
          await tester.pumpAndSettle();

          final listFavorite = find.text("List Favorites");
          expect(listFavorite, findsOneWidget);
          await tester.tap(listFavorite);
          await tester.pumpAndSettle();

          final check1Menu = find.text(menu);
          expect(check1Menu, findsOneWidget);
          await tester.tap(check1Menu);
          await tester.pumpAndSettle();

          final deleteFavorite = find.text("Delete Favorite");
          expect(deleteFavorite, findsOneWidget);
          await tester.tap(deleteFavorite);
          await tester.pumpAndSettle();
          await tester.pageBack();
          await tester.pumpAndSettle();

          final check2Menu = find.text(menu);
          expect(check2Menu, findsNothing);
        },
      );
    },
  );
}
