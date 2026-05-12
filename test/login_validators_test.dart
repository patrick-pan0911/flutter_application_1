//task 2
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/validators/login_validators.dart';

void main(){
  group('validateEmail',(){
    test('should return null for valid email',(){
      expect(validateEmail(''),'Email is required');
    });

    test('returns error for invalid email',(){
      expect(validateEmail('abc'),'Invalid email');
    });

    test('returns null for valid email', () {
      expect(validateEmail('user@example.com'), isNull);
    });
  }
  );

  group('validatePassword',(){
    test('returns error for empty password',(){
      expect(validatePassword(''),'Password is required');
    });

    test('returns error for password longer than 8 characters',(){
      expect(validatePassword('123456789'),'Password must be at most 8 characters');
    });

    test('returns null for valid password',(){
      expect(validatePassword('12345678'), isNull);
    });
  });
}