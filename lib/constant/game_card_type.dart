enum GameCardType {
  weapon('assets/card_icons/weapon_32.png', 'assets/card_icons/weapon_16.png'),
  monster(
    'assets/card_icons/monster_32.png',
    'assets/card_icons/monster_16.png',
  ),
  consumable(
    'assets/card_icons/consumable_32.png',
    'assets/card_icons/consumable_16.png',
  ),
  accessory(
    'assets/card_icons/accessory_32.png',
    'assets/card_icons/accessory_16.png',
  );

  const GameCardType(this.asset, this.assetSmall);

  final String asset;
  final String assetSmall;
}
