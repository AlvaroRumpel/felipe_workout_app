extension StringExtensions on String {
  String get formatted {
    if (isEmpty) {
      return this;
    }

    const lowerCaseWords = ['com', 'na', 'e', 'de', 'do', 'da'];

    final stringSeparated = split(' ');

    final stringFormattedList = <String>[];

    for (final word in stringSeparated) {
      if (lowerCaseWords.contains(word.toLowerCase())) {
        stringFormattedList.add(word.toLowerCase());
        continue;
      }

      if (word == word.toUpperCase() && word.length <= 3) {
        stringFormattedList.add(word);
        continue;
      }

      stringFormattedList.add(
        word[0].toUpperCase() + word.substring(1).toLowerCase(),
      );
    }

    return stringFormattedList.join(' ');
  }
}
