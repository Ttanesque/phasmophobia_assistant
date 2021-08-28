import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';

class Mare implements Ghost {
  String _name = "mare";

  List<String> _descriptions = ["mare.description1"];

  String _strength = "mare.strength";

  String _weakness = "mare.weakness";

  List<Evidence> _evidences = [GhostWriting(), GhostOrb(), SpiritBox()];

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
