import 'package:flutter/services.dart' show rootBundle;
import 'package:phasmophobiaassistant/models/objectives/Objective.dart';
import 'package:yaml/yaml.dart';

class ObjectiveController {
  List<Objective> _objectives = [];
  bool isInit;

  ObjectiveController() {
    isInit = false;
  }

  init() async {
    var value = await rootBundle.loadString("assets/objectives.yml");
    var doc = loadYaml(value);
    for (var item in doc['objectives']) {
      for (var current_item in item.entries) {
        current_item = current_item.value;
        var images = List.from(current_item['images']).cast<String>();
        if (images[0] == "none") images.clear();
        var obj = Objective(current_item['name'], images);
        _objectives.add(obj);
      }
    }
    isInit = true;
  }

  List<String> objectivesNames() {
    List<String> res = [];
    for (var item in _objectives) {
      res.add(item.name());
    }
    return res;
  }

  List<Objective> objectives() {
    return _objectives;
  }
}
