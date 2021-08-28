import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';

class Poltergeist implements Ghost {
  String _name = "poltergeist";

  List<String> _descriptions = [
    "poltergeist.description1",
    "poltergeist.description2",
  ];

  String _strength = "poltergeist.strength";

  String _weakness = "poltergeist.weakness";

  List<Evidence> _evidences = [GhostWriting(), Fingerprints(), SpiritBox()];

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
