import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';

class Myling implements Ghost {
  String _name = "myling";

  List<String> _description = [];

  String _strength = "myling.strength";

  String _weakness = "myling.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), GhostWriting(), Fingerprints()];

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
