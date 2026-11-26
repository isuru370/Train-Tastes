import 'package:flutter_test/flutter_test.dart';
import 'package:train_tastes/core/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('rejects empty', () => expect(Validators.email(''), isNotNull));
    test('rejects bad format', () => expect(Validators.email('kasun@'), isNotNull));
    test('accepts valid email', () => expect(Validators.email('kasun@gmail.com'), isNull));
    test('ignores spaces around', () => expect(Validators.email('  a@b.lk '), isNull));
  });

  group('Validators.password', () {
    test('rejects empty', () => expect(Validators.password(''), isNotNull));
    test('rejects under 6 chars', () => expect(Validators.password('12345'), isNotNull));
    test('accepts 6+ chars', () => expect(Validators.password('123456'), isNull));
  });

  group('Validators.name', () {
    test('rejects 1 letter', () => expect(Validators.name('A'), isNotNull));
    test('accepts a name', () => expect(Validators.name('Kasun'), isNull));
  });
}
