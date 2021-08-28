import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';

class Demon implements Ghost {
  String _name = "demon";

  List<String> _descriptions = [
    "demon.description1",
    "demon.description2",
  ];

  String _strength = "demon.strength";

  String _weakness = "demon.weakness";

  List<Evidence> _evidences = [
    FreezingTemperatures(),
    GhostWriting(),
    Fingerprints()
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
