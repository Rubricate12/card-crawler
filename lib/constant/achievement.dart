enum Achievement {
  dungeonCrawlerI(
    'Dungeon Crawler I',
    'Finish the first level of the game',
    '',
  ),
  dungeonCrawlerII(
    'Dungeon Crawler II',
    'Finish the second level of the game',
    '',
  ),
  dungeonCrawlerIII(
    'Dungeon Crawler III',
    'Finish the third level of the game',
    '',
  ),
  dungeonCrawlerIV(
    'Dungeon Crawler IV',
    'Finish the fourth level of the game',
    '',
  ),
  dungeonCrawlerV(
    'Dungeon Crawler V',
    'Finish the fifth level of the game',
    '',
  ),
  nice('Nice', 'Funny numbers', ''),
  fourOfAKind('4 of a kind', 'Get 4 of the same value card as rooms', ''),
  perfectAdventurer(
    'Perfect Adventurer',
    'Finish a dungeon with max health',
    '',
  );

  const Achievement(this.name, this.desc, this.asset);

  final String name;
  final String desc;
  final String asset;
}
