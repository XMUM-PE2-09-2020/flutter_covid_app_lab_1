import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_covid_app_lab_1/main.dart' as app;

//Author: ting sen
void main() {
  group('Signup Test', () {
    setUpAll(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    });
  });

  testWidgets('Redirect to Signup, Create a User', (WidgetTester tester) async {
    //Start App
    app.main();

    //Repeatedly calls pump until there are no longer any frames scheduled.
    await tester.pumpAndSettle();

    //Click on signup button on login page
    final redirectToSignupButton = find.widgetWithText(GestureDetector, 'Sign Up');
    await tester.tap(redirectToSignupButton);

    //Entering user credentials
    final phoneInputField = find.widgetWithIcon(TextFormField, Icons.phone);
    await tester.tap(phoneInputField);
    await tester.enterText(phoneInputField, '0172120848');

    final emailInputField = find.widgetWithIcon(TextFormField, Icons.email);
    await tester.tap(emailInputField);
    await tester.enterText(emailInputField, 'tester@email.com');

    final usernameInputField = find.widgetWithIcon(TextFormField, Icons.person);
    await tester.tap(usernameInputField);
    await tester.enterText(usernameInputField, 'tester');

    final passwordInputField = find.widgetWithIcon(TextFormField, Icons.lock);
    await tester.tap(passwordInputField);
    await tester.enterText(passwordInputField, 'tester');

    //Signup user
    final signupButton = find.widgetWithText(GestureDetector, 'REGISTER');
    await tester.tap(signupButton);

    //Snackbar showing up
    expect(find.byType(SnackBar), findsOneWidget);

    //Registration succcess
    expect(find.text('tester signed up successfully.'), findsOneWidget);

    //Registration failed
    expect(find.text('Sign up failed. Username existed.'), findsOneWidget);
  });
}
