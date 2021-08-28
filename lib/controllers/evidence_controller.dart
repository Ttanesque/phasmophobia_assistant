import 'package:phasmophobiaassistant/config/config.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
import 'package:phasmophobiaassistant/models/ghost/Banshee.dart';
import 'package:phasmophobiaassistant/models/ghost/Demon.dart';
import 'package:phasmophobiaassistant/models/evidences/Dots.dart';
import 'package:phasmophobiaassistant/models/evidences/EmfLevelFive.dart';
import 'package:phasmophobiaassistant/models/evidences/Evidence.dart';
import 'package:phasmophobiaassistant/models/evidences/Fingerprints.dart';
import 'package:phasmophobiaassistant/models/evidences/FreezingTemperatures.dart';
import 'package:phasmophobiaassistant/models/ghost/Ghost.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostOrb.dart';
import 'package:phasmophobiaassistant/models/evidences/GhostWriting.dart';
import 'package:phasmophobiaassistant/models/ghost/Goryo.dart';
import 'package:phasmophobiaassistant/models/ghost/Hantu.dart';
import 'package:phasmophobiaassistant/models/ghost/Jinn.dart';
import 'package:phasmophobiaassistant/models/ghost/Mare.dart';
import 'package:phasmophobiaassistant/models/ghost/Myling.dart';
import 'package:phasmophobiaassistant/models/ghost/Oni.dart';
import 'package:phasmophobiaassistant/models/ghost/Phantom.dart';
import 'package:phasmophobiaassistant/models/ghost/Poltergeist.dart';
import 'package:phasmophobiaassistant/models/ghost/Revenant.dart';
import 'package:phasmophobiaassistant/models/ghost/Shade.dart';
import 'package:phasmophobiaassistant/models/ghost/Spirit.dart';
import 'package:phasmophobiaassistant/models/evidences/SpiritBox.dart';
import 'package:phasmophobiaassistant/models/ghost/Wraith.dart';
import 'package:phasmophobiaassistant/models/ghost/Yokai.dart';
import 'package:phasmophobiaassistant/models/ghost/Yurei.dart';

class EvidenceController {
  bool emfSelected = false;

  bool fingerprintsSelected = false;

  bool temperatureSelected = false;

  bool orbSelected = false;

  bool writingSelected = false;

  bool spiritBoxSelected = false;

  bool dotsSelected = false;

  bool emfDiscarded = false;

  bool fingerprintsDiscarded = false;

  bool temperatureDiscarded = false;

  bool orbDiscarded = false;

  bool writingDiscarded = false;

  bool spiritBoxDiscarded = false;

  bool dotsDiscarded = false;

  String emf = i("emf.level.5");

  String fingerprints = i("fingerprints");

  String temperature = i("freezing.temperatures");

  String orbs = i("ghost.orbs");

  String writing = i("ghost.writing");

  String spiritBox = i("spirit.box");

  String dots = i("dots.projector");

  String spirit = i("spirit");

  String banshee = i("banshee");

  String wraith = i("wraith");

  String phantom = i("phantom");

  String poltergeist = i("poltergeist");

  String jinn = i("jinn");

  String mare = i("mare");

  String revenant = i("revenant");

  String shade = i("shade");

  String demon = i("demon");

  String yurei = i("yurei");

  String oni = i("oni");

  String yokai = i("yokai");

  String hantu = i("hantu");

  String goryo = i("goryo");

  String myling = i("myling");

  String ghosts =
      "spirit | wraith | phantom | poltergeist | banshee | jinn | mare | revenant | shade | demon | yurei | oni | shade | yokai | hantu | goryo | myling";

  bool selectEvidence(String evidence) {
    bool selected = true;

    if (evidence == emf && !emfDiscarded) {
      emfSelected = !emfSelected;
      emfDiscarded = false;
    } else if (evidence == fingerprints && !fingerprintsDiscarded) {
      fingerprintsSelected = !fingerprintsSelected;
      fingerprintsDiscarded = false;
    } else if (evidence == temperature && !temperatureDiscarded) {
      temperatureSelected = !temperatureSelected;
      temperatureDiscarded = false;
    } else if (evidence == orbs && !orbDiscarded) {
      orbSelected = !orbSelected;
      orbDiscarded = false;
    } else if (evidence == writing && !writingDiscarded) {
      writingSelected = !writingSelected;
      writingDiscarded = false;
    } else if (evidence == spiritBox && !spiritBoxDiscarded) {
      spiritBoxSelected = !spiritBoxSelected;
      spiritBoxDiscarded = false;
    } else if (evidence == dots && !dotsDiscarded) {
      dotsSelected = !dotsSelected;
      dotsDiscarded = false;
    } else {
      selected = false;
    }

    return selected;
  }

  bool discardEvidence(String evidence) {
    bool discarded = true;

    if (enableDiscardEvidence) {
      if (evidence == emf && !emfSelected) {
        emfSelected = false;
        emfDiscarded = !emfDiscarded;
      } else if (evidence == fingerprints && !fingerprintsSelected) {
        fingerprintsSelected = false;
        fingerprintsDiscarded = !fingerprintsDiscarded;
      } else if (evidence == temperature && !temperatureSelected) {
        temperatureSelected = false;
        temperatureDiscarded = !temperatureDiscarded;
      } else if (evidence == orbs && !orbSelected) {
        orbSelected = false;
        orbDiscarded = !orbDiscarded;
      } else if (evidence == writing && !writingSelected) {
        writingSelected = false;
        writingDiscarded = !writingDiscarded;
      } else if (evidence == spiritBox && !spiritBoxSelected) {
        spiritBoxSelected = false;
        spiritBoxDiscarded = !spiritBoxDiscarded;
      } else if (evidence == dots && !dotsDiscarded) {
        dotsSelected = false;
        dotsDiscarded = !dotsDiscarded;
      } else {
        discarded = false;
      }
    } else {
      discarded = selectEvidence(evidence);
    }

    return discarded;
  }

  String verifyEvidencesSelected() {
    String evidences = "";

    if (emfSelected) {
      evidences += "emf.level.5 ";
    }

    if (fingerprintsSelected) {
      evidences += "fingerprints ";
    }

    if (temperatureSelected) {
      evidences += "freezing.temperatures ";
    }

    if (orbSelected) {
      evidences += "ghost.orbs ";
    }

    if (writingSelected) {
      evidences += "ghost.writing ";
    }

    if (spiritBoxSelected) {
      evidences += "spirit.box ";
    }

    if (dotsSelected) {
      evidences += "dots.projector";
    }

    return evidences.trim();
  }

  String verifyEvidencesDiscarded() {
    String evidences = "";

    if (emfDiscarded) {
      evidences += "emf.level.5 ";
    }

    if (fingerprintsDiscarded) {
      evidences += "fingerprints ";
    }

    if (temperatureDiscarded) {
      evidences += "freezing.temperatures ";
    }

    if (orbDiscarded) {
      evidences += "ghost.orbs ";
    }

    if (writingDiscarded) {
      evidences += "ghost.writing ";
    }

    if (spiritBoxDiscarded) {
      evidences += "spirit.box ";
    }

    if (dotsDiscarded) {
      evidences += "dots.projector";
    }

    return evidences.trim();
  }

  bool verifyGhost() {
    String evidencesSelected = verifyEvidencesSelected();
    String evidencesDiscarded = verifyEvidencesDiscarded();
    ghosts = defineGhost(evidencesSelected, evidencesDiscarded);
    saveEvidences();
    return ghosts.isNotEmpty;
  }

  void saveEvidences() {
    Map<String, bool> map = new Map();
    map['emfSelected'] = emfSelected;
    map['fingerprintsSelected'] = fingerprintsSelected;
    map['temperatureSelected'] = temperatureSelected;
    map['orbSelected'] = orbSelected;
    map['writingSelected'] = writingSelected;
    map['spiritBoxSelected'] = spiritBoxSelected;
    map['dotsSelected'] = dotsSelected;
    map['emfDiscarded'] = emfDiscarded;
    map['fingerprintsDiscarded'] = fingerprintsDiscarded;
    map['temperatureDiscarded'] = temperatureDiscarded;
    map['orbDiscarded'] = orbDiscarded;
    map['writingDiscarded'] = writingDiscarded;
    map['spiritBoxDiscarded'] = spiritBoxDiscarded;
    map['dotsDiscarded'] = dotsDiscarded;
    saveMissionState(map);
  }

  String defineGhost(String evidencesSelected, String evidencesDiscarded) {
    List<String> selectedEvidencesList =
        evidencesSelected.isNotEmpty ? evidencesSelected.split(" ") : [];

    List<Ghost> possibleGhostsList =
        filterSelectedGhosts(getAllGhosts(), selectedEvidencesList);

    if (enableDiscardEvidence) {
      List<String> selectedDiscardedList = evidencesDiscarded.split(" ");

      possibleGhostsList =
          filterDiscardedGhosts(possibleGhostsList, selectedDiscardedList);
    }

    List<String> possibleEvidences =
        determinePossibleEvidences(possibleGhostsList);

    if (possibleGhostsList.isNotEmpty) {
      discardEvidences(possibleEvidences);
    }

    return getGhostsNames(possibleGhostsList);
  }

  void verifyLastEvidence(List<Ghost> possibleGhostsList) {
    if (possibleGhostsList.length == 1) {
      Ghost lastGhost = possibleGhostsList.first;
      for (Evidence evidence in lastGhost.evidences()) {
        String lastEvidence = evidence.name();
        if (lastEvidence == "emf.level.5") {
          emfSelected = true;
          emfDiscarded = false;
        } else if (lastEvidence == "fingerprints") {
          fingerprintsSelected = true;
          fingerprintsDiscarded = false;
        } else if (lastEvidence == "freezing.temperatures") {
          temperatureSelected = true;
          temperatureDiscarded = false;
        } else if (lastEvidence == "ghost.orbs") {
          orbSelected = true;
          orbDiscarded = false;
        } else if (lastEvidence == "ghost.writing") {
          writingSelected = true;
          writingDiscarded = false;
        } else if (lastEvidence == "spirit.box") {
          spiritBoxSelected = true;
          spiritBoxDiscarded = false;
        } else if (lastEvidence == "dots.projector") {
          dotsSelected = true;
          dotsDiscarded = false;
        }
      }
    }
  }

  void discardEvidences(List<String> possibleEvidences) {
    List<Evidence> allEvidences = getAllEvidences();

    for (Evidence evidence in allEvidences) {
      if (evidence.name() == "emf.level.5") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!emfSelected && !emfDiscarded) {
            emfDiscarded = true;
          }
        } else {
          emfDiscarded = false;
        }
      } else if (evidence.name() == "fingerprints") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!fingerprintsSelected && !fingerprintsDiscarded) {
            fingerprintsDiscarded = true;
          }
        } else {
          fingerprintsDiscarded = false;
        }
      } else if (evidence.name() == "freezing.temperatures") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!temperatureSelected && !temperatureDiscarded) {
            temperatureDiscarded = true;
          }
        } else {
          temperatureDiscarded = false;
        }
      } else if (evidence.name() == "ghost.orbs") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!orbSelected && !orbDiscarded) {
            orbDiscarded = true;
          }
        } else {
          orbDiscarded = false;
        }
      } else if (evidence.name() == "ghost.writing") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!writingSelected && !writingDiscarded) {
            writingDiscarded = true;
          }
        } else {
          writingDiscarded = false;
        }
      } else if (evidence.name() == "spirit.box") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!spiritBoxSelected && !spiritBoxDiscarded) {
            spiritBoxDiscarded = true;
          }
        } else {
          spiritBoxDiscarded = false;
        }
      } else if (evidence.name() == "dots.projector") {
        if (!possibleEvidences.contains(evidence.name())) {
          if (!dotsSelected && !dotsDiscarded) {
            dotsDiscarded = true;
          }
        } else {
          dotsDiscarded = false;
        }
      }
    }
  }

  List<Evidence> getAllEvidences() {
    return [
      EmfLevelFive(),
      Fingerprints(),
      FreezingTemperatures(),
      GhostOrb(),
      GhostWriting(),
      SpiritBox(),
      DotsProjector()
    ];
  }

  List<String> determinePossibleEvidences(List<Ghost> possibleGhostsList) {
    List<String> possibleEvidences = [];

    if (possibleGhostsList.isNotEmpty) {
      for (Ghost ghost in possibleGhostsList) {
        for (Evidence evidence in ghost.evidences()) {
          if (!possibleEvidences.contains(evidence.name())) {
            possibleEvidences.add(evidence.name());
          }
        }
      }
    } else {
      getAllEvidences().forEach((element) {
        possibleEvidences.add(element.name());
      });
    }
    return possibleEvidences;
  }

  List<Ghost> getAllGhosts() {
    return [
      Spirit(),
      Wraith(),
      Phantom(),
      Poltergeist(),
      Banshee(),
      Jinn(),
      Mare(),
      Revenant(),
      Shade(),
      Demon(),
      Yurei(),
      Oni(),
      Yokai(),
      Hantu(),
      Goryo(),
      Myling()
    ];
  }

  List<Ghost> filterDiscardedGhosts(
      List<Ghost> selectedGhostsList, List<String> selectedDiscardedList) {
    List<Ghost> possibleGhostsList = [];
    if (selectedGhostsList.isEmpty) {
      selectedGhostsList = getAllGhosts();
    }

    for (Ghost ghost in selectedGhostsList) {
      bool addGhost = true;
      for (String evidenceName in selectedDiscardedList) {
        bool found = false;
        for (Evidence evidence in ghost.evidences()) {
          if (evidence.name() == evidenceName) {
            found = true;
            break;
          }
        }
        if (found) {
          addGhost = false;
          break;
        }
      }
      if (addGhost) {
        possibleGhostsList.add(ghost);
      }
    }
    return possibleGhostsList;
  }

  String getGhostsNames(List<Ghost> selectedGhostsList) {
    String ghostFound = "";
    if (selectedGhostsList.isNotEmpty) {
      selectedGhostsList.forEach((element) {
        ghostFound += element.name() + " | ";
      });
      ghostFound = ghostFound.trim().substring(0, ghostFound.length - 2);
    }
    return ghostFound.trim();
  }

  List<Ghost> filterSelectedGhosts(
      List<Ghost> ghostsList, List<String> selectedEvidencesList) {
    List<Ghost> selectedGhostsList = [];

    if (selectedEvidencesList.isNotEmpty) {
      for (Ghost ghost in ghostsList) {
        bool possibleGhost = true;

        for (String evidenceName in selectedEvidencesList) {
          bool evidenceFound = false;
          for (Evidence evidence in ghost.evidences()) {
            if (evidence.name() == evidenceName) {
              evidenceFound = true;
              break;
            }
          }
          if (!evidenceFound) {
            possibleGhost = false;
            break;
          }
        }
        if (possibleGhost) {
          selectedGhostsList.add(ghost);
        }
      }
    } else {
      selectedGhostsList = ghostsList;
    }

    return selectedGhostsList;
  }

  void reset() {
    emfSelected = false;
    fingerprintsSelected = false;
    temperatureSelected = false;
    orbSelected = false;
    writingSelected = false;
    spiritBoxSelected = false;
    dotsSelected = false;
    emfDiscarded = emfSelected;
    fingerprintsDiscarded = fingerprintsSelected;
    temperatureDiscarded = temperatureSelected;
    orbDiscarded = orbSelected;
    writingDiscarded = writingSelected;
    spiritBoxDiscarded = spiritBoxSelected;
    dotsDiscarded = dotsSelected;
    saveEvidences();
    ghosts =
        "spirit | wraith | phantom | poltergeist | banshee | jinn | mare | revenant | shade | demon | yurei | oni | shade | yokai | hantu | goryo | myling";
  }
}
