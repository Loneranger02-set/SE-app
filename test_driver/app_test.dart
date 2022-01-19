import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login', () {
    final button = find.byValueKey("LoginButton");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Testing login', () async {
      // await driver.tap(button);
      //
      // final text = find.text('Sign In');
      //
      // expect(await driver.getText(text), 'Sign In');

      var emailField = find.byValueKey('emailField');
      print("Email found");
      await driver.tap(emailField);  // acquire focus
      print("tapped");
       await driver.enterText("test1@gmail.com");  // enter text
      //
      // await driver.waitFor(find.text("abc"));
      // print("abc found");
      var pwdField = find.byValueKey('pwdField');
      print("Password found");
      await driver.tap(pwdField);  // acquire focus
      print("tapped password");
      await driver.enterText("test1");  // enter text

      await driver.tap(button);
      // final text = find.text('Enter a valid email !');

     // expect(await driver.getText(text), 'Enter a valid email !');

      var err = await driver.getText(find.byValueKey('error'));
      print("Found ");

      expect(err, 'Unable to log in with provided credentials.');
    });
  });
}
