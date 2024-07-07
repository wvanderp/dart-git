// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_git/dart_git.dart';

class CommitCommand extends Command<int> {
  @override
  final name = 'commit';

  @override
  final description =
      'will create a new commit with the current index as the tree';

  CommitCommand() {
    argParser.addOption('message', abbr: 'm');
    argParser.addFlag('all', abbr: 'A', defaultsTo: false);
  }

  @override
  int run() {
    var gitRootDir = GitRepository.findRootDir(Directory.current.path)!;
    var repo = GitRepository.load(gitRootDir);

    var message = argResults!['message'] as String? ?? '';
    var addAll = argResults!['all'] as bool;

    var date = DateTime.now();

    repo.commit(
      message: message,
      author: GitAuthor(
        name: 'Vishesh Handa',
        email: 'random@gmail.com',
        date: date,
      ),
      addAll: addAll,
    );

    return 0;
  }
}
