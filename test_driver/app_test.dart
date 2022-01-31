import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  /*
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
      // var pwdField = find.byValueKey('pwdField');
      // print("Password found");
      // await driver.tap(pwdField);  // acquire focus
      // print("tapped password");
      // await driver.enterText("test1");  // enter text

      await driver.tap(button);
      // final text = find.text('Enter a valid email !');

     // expect(await driver.getText(text), 'Enter a valid email !');

      var err = await driver.getText(find.byValueKey('error'));
      print("Found ");

      expect(err, 'Unable to log in with provided credentials.');
    });


  });*/

  group('Register', () {
    final button = find.byValueKey("SignUpButton");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Testing registration', () async {
      // await driver.tap(button);
      //
      // final text = find.text('Sign In');
      //
      // expect(await driver.getText(text), 'Sign In');
      await driver.tap(button);
      var emailField = find.byValueKey('emailReg');
      print("Email found");
      await driver.tap(emailField);  // acquire focus
      print("tapped");
      await driver.enterText("test1@gmail.com");  // enter text
      //
      // await driver.waitFor(find.text("abc"));
      // print("abc found");
      var pwd1Field = find.byValueKey('pwd1Reg');
      print("Password 1 found");
      await driver.tap(pwd1Field);  // acquire focus
      print("tapped password 1");
      await driver.enterText("test1");  // enter text

      // var pwd2Field = find.byValueKey('pwd2Reg');
      // print("Password 2 found");
      // await driver.tap(pwd2Field);  // acquire focus
      // print("tapped password 2");
      // await driver.enterText("test1");  // enter text


      final btn2=find.byValueKey("signupReg");

      await driver.tap(btn2);

      print("tapped signup button");
      // final text = find.text('Enter a valid email !');

      // expect(await driver.getText(text), 'Enter a valid email !');

      var err = await driver.getText(find.byValueKey('errorReg'));
      print("Found ");

      expect(err, 'Unable to log in with provided credentials.');
    });


  });

}
