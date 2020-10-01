import 'package:bank_finder/UI/dashboard.dart';
import 'package:bank_finder/getit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupLocator();
  Widget buildWidget(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: child,
    );
  }

  tearDownAll(() {
    print("all test completed!");
  });
  testWidgets("valid format but no bank found, show no bank found alert",
      (WidgetTester tester) async {
    var dashboard = buildWidget(DashBoard());
    await tester.pumpWidget(dashboard);
    var search = find.byKey(const Key('search_button'));
    await tester.tap(search);
    await tester.pump();
    var searchBox = find.byKey(const Key("search_box_textfield"));
    await tester.enterText(searchBox, "ABCD0000000");
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpFrames(dashboard, Duration(seconds: 4));
    var bankNotFoundText = find.byKey(const Key("Bank Not Found"));
    expect(bankNotFoundText, findsOneWidget);
  });
  testWidgets("valid format and bank found, show bank found alert",
      (WidgetTester tester) async {
    var dashboard = buildWidget(DashBoard());
    await tester.pumpWidget(dashboard);
    var search = find.byKey(const Key('search_button'));
    await tester.tap(search);
    await tester.pump();
    var searchBox = find.byKey(const Key("search_box_textfield"));
    await tester.enterText(searchBox, "TMBL0000008");
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpFrames(dashboard, Duration(seconds: 4));
    var bankFoundText = find.byKey(const Key("Bank Found"));
    expect(bankFoundText, findsOneWidget);
  });
  testWidgets("valid format and bank found, add to favourites",
      (WidgetTester tester) async {
    const String ifsc = "TMBL0000008";
    var dashboard = buildWidget(DashBoard());
    await tester.pumpWidget(dashboard);
    var search = find.byKey(const Key('search_button'));
    await tester.tap(search);
    await tester.pump();
    var searchBox = find.byKey(const Key("search_box_textfield"));
    await tester.enterText(searchBox, ifsc);
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpFrames(dashboard, Duration(seconds: 4));
    var addFavButton = find.byKey(const Key("Add_to_favourites_button"));
    await tester.tap(addFavButton);
    await tester.pumpFrames(dashboard, Duration(seconds: 4));
    var listTile = find.byKey(const Key(ifsc));
    expect(listTile, findsOneWidget);
  });
  testWidgets("invalid format, show snackbar", (WidgetTester tester) async {
    const String ifsc = "ab1v";
    var dashboard = buildWidget(DashBoard());
    await tester.pumpWidget(dashboard);
    var search = find.byKey(const Key('search_button'));
    await tester.tap(search);
    await tester.pump();
    var searchBox = find.byKey(const Key("search_box_textfield"));
    await tester.enterText(searchBox, ifsc);
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpFrames(dashboard, Duration(seconds: 1));
    var snackbar = find.byKey(const Key("invalid snackbar"));
    expect(snackbar, findsOneWidget);
  });
}
