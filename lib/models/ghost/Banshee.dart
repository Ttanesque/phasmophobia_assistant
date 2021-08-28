import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';

class Banshee implements Ghost {
  String _name = "banshee";

  List<String> _description = [
    "banshee.description1",
    "banshee.description2",
  ];

  String _strength = "banshee.strength";

  String _weakness = "banshee.weakness";

  List<Evidence> _evidences = [GhostOrb(), Fingerprints(), DotsProjector()];

  @override
  List<String> descriptions() {
    return _description;
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
