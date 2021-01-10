import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_covid_app_lab_1/main.dart' as app;

//Author: ting sen
//flutter drive  --driver=test/test_driver/integration_test_driver.dart  --target=test/integration_test/signup_test.dart
void main() {
  group('Login Test', () {
    setUpAll(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    });
  });

  testWidgets('Redirect to Signup, Create a User', (WidgetTester tester) async {
    //Start App
    app.main();

    //Repeatedly calls pump until there are no longer any frames scheduled.
    await tester.pumpAndSettle();

    //Entering user credentials
    final usernameInputField = find.byKey(Key('login_username_input_field'));
    await tester.tap(usernameInputField);
    await tester.enterText(usernameInputField, 'tester');

    final passwordInputField = find.byKey(Key('login_password_input_field'));
    await tester.tap(passwordInputField);
    await tester.enterText(passwordInputField, 'tester');

    //Login user
    final signupButton = find.byKey(Key('login_button'));
    await tester.tap(signupButton);

    //Snackbar showing up
    expect(find.byType(SnackBar), findsOneWidget);

    //Login succcess
    expect(find.text('tester logged up successfully.'), findsOneWidget);

    //Login failed
    expect(find.text('Login failed.'), findsOneWidget);
  });
}
