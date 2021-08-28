import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';

class Oni implements Ghost {
  String _name = "oni";

  List<String> _descriptions = [
    "oni.description1",
    "oni.description2",
    "oni.description3",
  ];

  String _strength = "oni.strength";

  String _weakness = "oni.weakness";

  List<Evidence> _evidences = [
    EmfLevelFive(),
    FreezingTemperatures(),
    DotsProjector()
  ];

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  List<Evidence> evidences() {
    return _evidences;
  }

  @override
  String name() {
    return _name;
  }

  @override
  String strength() {
    return _strength;
  }

  @override
  String weakness() {
    return _weakness;
  }
}
