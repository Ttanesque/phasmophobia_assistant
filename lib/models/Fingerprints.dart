import 'package:phasmophobiaassistant/models/Evidence.dart';

class Fingerprints implements Evidence {
  String _name = "fingerprints";

  List<String> _descriptions = [
    "fingerprints.description1",
  ];

  List<String> _howItWorks = [
    "fingerprints.howitworks1",
    "fingerprints.howitworks2",
    "fingerprints.howitworks3",
    "fingerprints.howitworks4",
  ];

  String _ghosts = "fingerprints.ghosts";

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  String ghosts() {
    return _ghosts;
  }

  @override
  List<String> howItWorks() {
    return _howItWorks;
  }

  @override
  String name() {
    return _name;
  }
}
