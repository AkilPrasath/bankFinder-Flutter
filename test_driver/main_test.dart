import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('integration test', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    test(
      'add to favourites',
      () async {
        String ifsc = "TMBL0000004";
        var searchButton = find.byValueKey("search_button");
        var searchTextField = find.byValueKey("search_box_textfield");
        var addToFavButton = find.byValueKey("Add_to_favourites_button");
        var listView = find.byValueKey("bankList");
        var listItem = find.byValueKey("TMBL0000004");

        await driver.runUnsynchronized(() async {
          await driver.setTextEntryEmulation(enabled: true);

          await driver.waitFor(searchButton);
          await driver.tap(searchButton);
          await driver.waitFor(searchTextField);
          await driver.tap(searchTextField);

          await driver.enterText(ifsc);
          await driver.waitFor(find.byValueKey("Add_to_favourites_button"));
          await driver.tap(addToFavButton);
          await driver.scrollUntilVisible(listView, listItem, dyScroll: -300);
          await driver.tap(listItem);
          expect(await driver.getText(find.byValueKey("ifsc")), "TMBL0000004");
        });
      },
    );
    test("copy to clipboard", () async {
      String ifsc = "TMBL0000004";
      String clipBoardData =
          '{"id":1,"name":"Tamilnadu Mercantile Bank","branch":"Virudhunagar","code":"TMBL","address":"129-A, Madurai Road, Virudhunagar 626 001","city":"MADURAI","district":"MADURAI","state":"TAMIL NADU","ifsc":"TMBL0000004","contact":null,"stdCode":"4562","neft":true,"upi":true,"rtgs":true,"imps":true}';
      var listTile = find.byValueKey(ifsc);
      var copyButton = find.byValueKey("copy_clipboard_button " + ifsc);

      await driver.tap(listTile);
      await driver.tap(copyButton);
      var resultCopiedData = await driver.requestData("clipboard");
      expect(resultCopiedData, clipBoardData);
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
