import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_covid_app_lab_1/main.dart' as app;

//Author: ting sen
//flutter drive  --driver=test/test_driver/integration_test_driver.dart  --target=test/integration_test/signup_test.dart
void main() {
  group('Signup Test', () {
    setUpAll(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    });
  });

  testWidgets('Redirect to Signup, Create a User', (WidgetTester tester) async {
    //Start App
    await tester.pumpWidget(app.MyApp());

    //Repeatedly calls pump until there are no longer any frames scheduled.
    await tester.pumpAndSettle();

    //Click on signup button on login page
    final redirectToSignupButton =
        find.widgetWithText(GestureDetector, 'Sign Up');
    await tester.tap(redirectToSignupButton);

    //Wait for frames to load
    await tester.pumpAndSettle();

    //Entering user credentials
    final phoneInputField = find.byKey(Key('signup_phone_input_field'));
    await tester.enterText(phoneInputField, '0172120848');

    final emailInputField = find.byKey(Key('signup_email_input_field'));
    await tester.enterText(emailInputField, 'tester@email.com');

    final usernameInputField = find.byKey(Key('signup_username_input_field'));
    await tester.enterText(usernameInputField, 'tester');

    final passwordInputField = find.byKey(Key('signup_password_input_field'));
    await tester.enterText(passwordInputField, 'tester');

    //Signup user
    final signupButton = find.widgetWithText(GestureDetector, 'REGISTER');
    await tester.tap(signupButton);

    //Wait for frames to load
    await tester.pumpAndSettle();

    //Snackbar showing up
    expect(find.byType(SnackBar), findsOneWidget);

    //Registration succcess
    expect(find.text('tester signed up successfully.'), findsOneWidget);

    //Registration failed
    expect(find.text('Sign up failed. Username existed.'), findsOneWidget);

    //expect(find.byKey(Key('homescreen')), findsOneWidget);
  });
}
