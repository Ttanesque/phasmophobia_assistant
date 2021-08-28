import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';

import 'Ghost.dart';

class Yokai implements Ghost {
  String _name = "yokai";

  List<String> _descriptions = [];

  String _strength = "yokai.strength";

  String _weakness = "yokai.weakness";

  List<Evidence> _evidences = [SpiritBox(), GhostOrb(), DotsProjector()];

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
