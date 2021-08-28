import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';

class Jinn implements Ghost {
  String _name = "jinn";

  List<String> _descriptions = [
    "jinn.description1",
    "jinn.description2",
  ];

  String _strength = "jinn.strength";

  String _weakness = "jinn.weakness";

  List<Evidence> _evidences = [
    EmfLevelFive(),
    FreezingTemperatures(),
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
