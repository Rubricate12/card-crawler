import '../../model/game_data.dart';

abstract class Effect {
  Effect(this.name, this.desc);

  String name;
  String desc;

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

/*abstract class OnPlace extends Effect {
  OnPlace(super.name, super.desc);
}*/