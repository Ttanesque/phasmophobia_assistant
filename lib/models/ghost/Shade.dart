import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';

class Shade implements Ghost {
  String _name = "shade";

  List<String> _descriptions = [
    "shade.description1",
    "shade.description2",
  ];

  String _strength = "shade.strength";

  String _weakness = "shade.weakness";

  List<Evidence> _evidences = [
    EmfLevelFive(),
    FreezingTemperatures(),
    GhostWriting()
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
