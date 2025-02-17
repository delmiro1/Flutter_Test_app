import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/features/login/views/login_view.dart';
import '../../test_helper.dart';

void main() {

  group('Login Page UI Elements', ()
  {

  testWidgets('should have the text Login',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);

      expect(find.text('Login'), findsOneWidget);
  });

    testWidgets('should have an Email and Password text forms',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);

      expect(find.byType(TextFormField), findsNWidgets(2));
  });
  
    testWidgets('should have an Submit button',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);

      expect(find.byType(ElevatedButton), findsOneWidget);
  });


});
  
  group('Email & Password text field behavior',()
  {    
  testWidgets('should retain their input values',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);

    // Find TextFormFields using the label text
    final emailField = find.widgetWithText(TextFormField, 'Email');
    final passwordField = find.widgetWithText(TextFormField, 'Password');

    // Enter a valid email
    await tester.enterText(emailField, TestHelper.ValidMail);
    await tester.pump();

    // Enter a password
    await tester.enterText(passwordField, TestHelper.ValidPassword);
    await tester.pump();

    // Verify if email\password are the same as input
    expect((tester.widget(emailField) as TextFormField).controller?.text,
        TestHelper.ValidMail);
    expect((tester.widget(passwordField) as TextFormField).controller?.text,
        TestHelper.ValidPassword);
  });
  
  testWidgets('TODO',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);
 
  });  
  
  });

  group('Submit button behavior',()
  {    
  testWidgets('should ask for an email if empty',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);
    // Find email field using label text
    final emailField = find.widgetWithText(TextFormField, 'Email');
    
    // Enter invalid email
    await tester.enterText(emailField, '');

    // Find and tap submit button to trigger validation
    final submitButton = find.text('Submit');
    await tester.tap(submitButton);
    await tester.pump();

    // Verify error message appears
    expect(find.text('Please enter your email'), findsOneWidget);
 
  });  
  
  testWidgets('should ask for an valid email if invalid',
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: LoginView(),),);
    // Find email field using label text
    final emailField = find.widgetWithText(TextFormField, 'Email');
    
    // Enter invalid email
    await tester.enterText(emailField, TestHelper.InvalidMail);

    // Find and tap submit button to trigger validation
    final submitButton = find.text('Submit');
    await tester.tap(submitButton);
    await tester.pump();

    // Verify error message appears
    expect(find.text('Please enter a valid email'), findsOneWidget);
 
  });  

  });

}