import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';

class Phantom implements Ghost {
  String _name = "phantom";

  List<String> _descriptions = [
    "phantom.description1",
    "phantom.description2",
  ];

  String _strength = "phantom.strength";

  String _weakness = "phantom.weakness";

  List<Evidence> _evidences = [SpiritBox(), Fingerprints(), DotsProjector()];

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
