import 'package:file/file.dart';
import 'package:file/local.dart';

bool isAbsolutePath(String path) {
  // Regular expressions for Unix-like and Windows absolute paths
  final unixLikeAbsolutePath = RegExp(r'^\/');
  final windowsAbsolutePath = RegExp(r'^[a-zA-Z]:\\');
  final windowsNetworkPath = RegExp(r'^\\\\');

  // Check if the path matches any of the absolute path patterns
  return unixLikeAbsolutePath.hasMatch(path) ||
      windowsAbsolutePath.hasMatch(path) ||
      windowsNetworkPath.hasMatch(path);
}

/// In Dart-Git we never want to rely on the current working directory
/// and therefore use this FS to make sure that we always use the full path
class LocalFileSystemWithChecks extends LocalFileSystem {
  const LocalFileSystemWithChecks();

  @override
  Directory directory(dynamic path) {
    assert(path is String);
    assert(isAbsolutePath(path));
    return super.directory(path);
  }

  @override
  File file(dynamic path) {
    assert(path is String);
    assert(isAbsolutePath(path));
    return super.file(path);
  }

  @override
  Link link(dynamic path) {
    assert(path is String);
    assert(isAbsolutePath(path));
    return super.link(path);
  }
}
