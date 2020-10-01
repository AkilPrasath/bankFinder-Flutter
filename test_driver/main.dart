import 'package:bank_finder/getit_service.dart';
import 'package:bank_finder/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestTextInput textInput = TestTextInput();
  Function(String) handler = (message) async {
    switch (message) {
      case "enter ifsc":
        textInput.register();
        textInput.enterText("TMBL0000004");
        textInput.receiveAction(TextInputAction.search);
        textInput.unregister();
        break;
      case 'clipboard':
        String clipboardData = (await Clipboard.getData("text/plain")).text;
        return clipboardData;
        break;
    }
  };

  isTest = true;
  enableFlutterDriverExtension(handler: handler);
  app.main();
}
