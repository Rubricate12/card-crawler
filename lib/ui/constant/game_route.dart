enum GameRoute {
  mainMenu('/'),
  gameplay('/gameplay');

  const GameRoute(this.path);
  final String path;
}
