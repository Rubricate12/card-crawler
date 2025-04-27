import '../../model/game_data.dart';

abstract class Effect {
  Effect(this.name, this.description);

  String name;
  String description;

  void trigger(GameData data);
}

abstract class OnField extends Effect {
  OnField(super.name, super.desc);
}

abstract class OnPicked extends Effect {
  OnPicked(super.name, super.desc);
}

abstract class OnUse extends Effect {
  OnUse(super.name, super.desc);
}

abstract class OnKill extends Effect {
  OnKill(super.name, super.desc);
}

abstract class AccessoryEffect extends Effect {
  AccessoryEffect(super.name, super.desc);
}
