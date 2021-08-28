import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';

class DotsProjector implements Evidence {
  String _name = "dots.projector";

  List<String> _descriptions = [];

  List<String> _howItWorks = [];

  List<String> _images = [];

  String _ghosts = "dots.projector.ghosts";

  @override
  String ghosts() {
    return _ghosts;
  }

  @override
  String name() {
    return _name;
  }

  @override
  List<String> howItWorks() {
    return _howItWorks;
  }

  @override
  List<String> descriptions() {
    return _descriptions;
  }

  @override
  List<String> images() {
    return _images;
  }
}
