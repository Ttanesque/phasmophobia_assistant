import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostOrb.dart';

import 'Ghost.dart';

class Hantu implements Ghost {
  String _name = "hantu";

  List<String> _descriptions = [];

  String _strength = "hantu.strength";

  String _weakness = "hantu.weakness";

  List<Evidence> _evidences = [
    FreezingTemperatures(),
    GhostOrb(),
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
