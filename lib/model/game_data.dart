class GameData {
  GameData({
    this.level = 1,
    this.health = 20,
    this.weapon = 0,
    this.durability = 0,
    this.turn = 1,
    this.hasHealed = false,
  });

  int level;
  int health;
  int weapon;
  int durability;
  int turn;
  bool hasHealed;
}
