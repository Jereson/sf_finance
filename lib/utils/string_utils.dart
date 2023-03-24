RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
// String Function(Match) addCommaToString = (Match match) => '${match[1]},';
String Function(Match) addSpaceToString = (Match match) => '${match[1]} ';
