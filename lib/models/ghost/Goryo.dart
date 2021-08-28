import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';

class Goryo implements Ghost {
  String _name = "goryo";

  List<String> _descriptions = [];

  String _strength = "goryo.strength";

  String _weakness = "goryo.weakness";

  List<Evidence> _evidences = [EmfLevelFive(), Fingerprints(), DotsProjector()];

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
