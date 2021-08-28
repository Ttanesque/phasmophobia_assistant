import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';

class Spirit implements Ghost {
  String _name = "spirit";

  List<String> _descriptions = [
    "spirit.description1",
  ];

  String _strength = "spirit.strength";

  String _weakness = "spirit.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), SpiritBox(), GhostWriting()];

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
