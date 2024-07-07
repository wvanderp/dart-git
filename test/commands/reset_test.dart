import 'package:test/test.dart';

import 'common.dart';

void main() {
  late GitCommandSetupResult s;

  setUpAll(() async {
    // creates a new temp folder and copies the .git folder into it
    s = await gitCommandTestFixtureSetupAll('merge');
  });

  setUp(() async => gitCommandTestSetup(s));

  test("run do a reset to a previous commit", () async {
    var commands = [
      'echo "Hello" > hello.txt',
      'add ./hello.txt',
      'commit -m "Initial commit"',
      'echo "Goodbye" > goodbye.txt',
      'add ./goodbye.txt',
      'commit -m "Second commit"',
      'reset --hard HEAD^',
    ];

    for (var command in commands) {
      await testGitCommand(s, command, ignoreOutput: true);
    }
  });
}

// FIXME: This needs to be tested with every fixture
