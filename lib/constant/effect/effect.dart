import '../../model/game_data.dart';

abstract class Effect {
  Effect(this.name, this.desc);

  String name;
  String desc;

  void trigger(GameData data);
}