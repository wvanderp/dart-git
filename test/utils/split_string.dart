List<String> splitString(String input) {
  // Regular expression to match quoted text or words
  final RegExp regExp = RegExp(r'\"(.*?)\"|\S+');

  // Find all matches in the input string
  final matches = regExp.allMatches(input);

  // Extract the matched strings and remove any surrounding quotes
  final result = matches.map((match) {
    String matchStr = match.group(0)!;
    // Remove surrounding quotes if present
    if (matchStr.startsWith('"') && matchStr.endsWith('"')) {
      matchStr = matchStr.substring(1, matchStr.length - 1);
    }
    return matchStr;
  }).toList();

  return result;
}
