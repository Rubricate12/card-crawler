import '../../model/game_data.dart';
import 'effect.dart';

class VampireMallet extends OnUse {
  VampireMallet()
    : super('Vampire Mallet', 'Fighting an enemy will recover 1 HP');

  @override
  void trigger(GameData data) {
    data.health += 1;
  }
}

class ArtemisBow extends OnUse {
  ArtemisBow()
    : super(
        'Artemis\'s Bow',
        'This weapon\'s durability will always recover to full when used',
      );

  @override
  void trigger(GameData data) {
    data.durability = 15;
  }
}

class WarAxe extends OnUse {
  WarAxe()
    : super(
        'War Axe',
        'This weapon will deal more damage the lower it\'s durability is',
      );

  @override
  void trigger(GameData data) {
    if (data.durability < 9 && data.durability >= 6) {
      data.buff = 3;
    } else if (data.durability < 6) {
      data.buff = 5;
    }
  }
}

class IchorSickle extends OnUse {
  IchorSickle()
    : super(
        'Ichor Sickle',
        'This weapon will decrease the opponent\'s strength',
      );

  @override
  void trigger(GameData data) {
    data.pickedCard!.value -= 3;
  }
}

class CursedSpear extends OnUse {
  CursedSpear()
    : super(
        'Cursed Spear',
        'In combat, this weapon is stronger by 5 points, but it will recharge after every use.',
      );

  @override
  void trigger(GameData data) {
    data.tempBuff = 5;
    if (data.cursedSpearCounter % 2 != 0) {
      data.cursedSpearDurability = data.durability;
      data.durability = 0;
    } else if (data.cursedSpearCounter > 1 &&
        data.cursedSpearCounter % 2 != 0) {
      data.durability = data.cursedSpearDurability;
    }
  }
}

class BloodlustBlade extends OnUse {
  BloodlustBlade()
    : super(
        'Bloodlust Blade',
        'This weapon will increase in power everytime it\'s used',
      );

  @override
  void trigger(GameData data) {
    data.buff = 1;
  }
}

class BlueStaff extends OnUse {
  BlueStaff()
    : super(
        'Blue Staff',
        'Every time this weapon is used, discard a card from the deck',
      );

  @override
  void trigger(GameData data) {
    data.graveyard.add(data.deck.removeLast());
  }
}

class HammerOfJustice extends OnUse {
  HammerOfJustice()
    : super(
        'Hammer Of Justice',
        'This weapon gets stronger for every 5 hp lost',
      );

  @override
  void trigger(GameData data) {
    int hpLost = (20 - (data.health) / 5) as int;
    data.tempBuff = hpLost * 2;
  }
}

class MirrorBlade extends OnUse {
  MirrorBlade()
    : super(
        'Mirror Blade',
        'This weapon will copy the strength of the monster you\'re facing, but it breaks easier',
      );

  @override
  void trigger(GameData data) {
    data.weapon!.value = data.pickedCard!.value;
  }
}
