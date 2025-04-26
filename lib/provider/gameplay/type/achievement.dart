enum Achievement {
  dungeonCrawler(0, 'Dungeon Crawler', 'Finish the game'),
  perfectAdventurer(1, 'Perfect Adventurer', 'Finish a game with max health');

  const Achievement(this.id, this.name, this.description);

  final int id;
  final String name;
  final String description;
}
