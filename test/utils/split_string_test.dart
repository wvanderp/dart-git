import 'package:test/test.dart';

import 'split_string.dart';

void main() {
  group('splitString', () {
    test('should split commands on spaces"', () {
      final input = 'commit --allow-empty -m "Initial commit"';
      final expected = ['commit', '--allow-empty', '-m', 'Initial commit'];
      expect(splitString(input), equals(expected));
    });

    test('should split commands on spaces and ignore extra spaces"', () {
      final input = 'commit  --allow-empty -m "Initial commit"';
      final expected = ['commit', '--allow-empty', '-m', 'Initial commit'];
      expect(splitString(input), equals(expected));
    });

    test('should split empty string"', () {
      final input = '';
      final expected = <String>[];
      expect(splitString(input), equals(expected));
    });

    test('should split single word"', () {
      final input = 'commit';
      final expected = ['commit'];
      expect(splitString(input), equals(expected));
    });

    test('should split single word with quotes"', () {
      final input = 'commit';
      final expected = ['commit'];
      expect(splitString(input), equals(expected));
    });

    test('should split commands with multiple quoted strings"', () {
      final input = 'commit -m "Initial commit" -m "Second commit"';
      final expected = [
        'commit',
        '-m',
        'Initial commit',
        '-m',
        'Second commit'
      ];
      expect(splitString(input), equals(expected));
    });
  });
}
