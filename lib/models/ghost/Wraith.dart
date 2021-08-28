import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';

class Wraith implements Ghost {
  String _name = "wraith";

  List<String> _descriptions = [
    "wraith.description1",
    "wraith.description2",
  ];

  String _strength = "wraith.strength";

  String _weakness = "wraith.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), SpiritBox(), DotsProjector()];

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
