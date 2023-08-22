extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get toImage => 'assets/image/$this.png';
}
