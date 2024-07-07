import 'package:test/test.dart';
import 'package:dart_git/utils/local_fs_with_checks.dart';

void main() {
  group('isAbsolutePath', () {
    test('should return true for Unix-style absolute path', () {
      expect(isAbsolutePath('/usr/bin'), isTrue);
    });

    test('should return true for Windows-style absolute path', () {
      expect(isAbsolutePath('C:\\Program Files'), isTrue);
    });

    test('should return true for Windows-style absolute path with file', () {
      expect(isAbsolutePath('D:\\Docs\\file.txt'), isTrue);
    });

    test('should return false for relative path', () {
      expect(isAbsolutePath('relative/path'), isFalse);
    });

    test('should return false for relative path with file', () {
      expect(isAbsolutePath('folder\\file.txt'), isFalse);
    });

    test('should return false for invalid Windows-style path', () {
      expect(isAbsolutePath('C:folder\\file.txt'), isFalse);
    });
  });
}
