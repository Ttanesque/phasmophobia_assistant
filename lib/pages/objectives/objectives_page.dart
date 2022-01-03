import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:phasmophobiaassistant/config/config.dart';
import 'package:phasmophobiaassistant/controllers/objective_controller.dart';
import 'package:phasmophobiaassistant/i18n/i18n.dart';
import 'package:phasmophobiaassistant/models/objectives/Objective.dart';
import 'package:phasmophobiaassistant/pages/objective_detail/objective_detail.dart';
import 'package:phasmophobiaassistant/widgets/timer_text.dart';

enum SingingCharacter { amateur, intermediate, professional }

const FIVE_MINUTES = 300000, TWO_MINUTES = 120000, ZERO_MINUTES = 0;

class ObjectivesPage extends StatefulWidget {
  final Map<String, dynamic> lastStateApp;

  ObjectivesPage(this.lastStateApp);

  @override
  _ObjectivesPageState createState() => _ObjectivesPageState(this.lastStateApp);
}

class _ObjectivesPageState extends State<ObjectivesPage>
    with AutomaticKeepAliveClientMixin<ObjectivesPage> {
  Stopwatch _stopwatch = new Stopwatch();

  List<bool> _selections = List.generate(2, (_) => false);

  TextEditingController _textEditingController = new TextEditingController();

  TimerText _timerText;

  SingingCharacter _difficult = SingingCharacter.amateur;

  List<Objective> _objectives = [];

  Map<String, bool> _objectivesStates = {};

  bool _emfReader = false,
      _lowTemperature = false,
      _dirtWater = false,
      _ghostPhoto = false,
      _motionSensor = false,
      _crucifix = false,
      _ghostEvent = false,
      _smudgeSticks = false,
      _saltFootprint = false,
      _candle = false,
      _parabolicMicrofone = false,
      _scapeHunt = false,
      _smudgeSticksHunt = false,
      _sanityBellow25 = false;

  _ObjectivesPageState(Map<String, dynamic> lastStateApp) {
    loadInitialValues(lastStateApp);
    int timer = ZERO_MINUTES;
    if (_difficult == SingingCharacter.amateur) {
      timer = FIVE_MINUTES;
    } else if (_difficult == SingingCharacter.intermediate) {
      timer = TWO_MINUTES;
    }
    _timerText = TimerText(_stopwatch, timer);
  }

  Future<void> fetchList() async {
    var objController = ObjectiveController();
    await objController.init();
    _objectives = objController.objectives();
    if (_objectivesStates.length != _objectives.length)
      _objectivesStates = Map.fromIterable(_objectives,
          key: (e) => e.name(), value: (_) => false);
  }

  void loadInitialValues(Map<String, dynamic> lastStateApp) {
    _textEditingController.text = lastStateApp['ghostName'] ?? "";
    loadGhostRespond(lastStateApp);
    loadDifficult(lastStateApp);
  }

  void loadDifficult(Map<String, dynamic> lastStateApp) {
    switch (lastStateApp['difficult']) {
      case "intermediate":
        _difficult = SingingCharacter.intermediate;
        break;
      case "professional":
        _difficult = SingingCharacter.professional;
        break;
      default:
        _difficult = SingingCharacter.amateur;
        break;
    }
  }

  void loadGhostRespond(Map<String, dynamic> lastStateApp) {
    if (lastStateApp['ghostRespond'] == "alone") {
      _selections[0] = true;
      _selections[1] = false;
    } else if (lastStateApp['ghostRespond'] == "everyone") {
      _selections[0] = false;
      _selections[1] = true;
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
        future: fetchList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: <Widget>[
                buildGhostNameAndRespondCard(),
                buildObjectiveTable(),
                buildTimerCard(),
                buildDificultButtons(),
                buildClearButton(),
              ],
            );
          } else {
            return Container(
              color: Colors.black,
            );
          }
        });
  }

  Wrap buildDificultButtons() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        buildDifficultOption(SingingCharacter.amateur),
        buildDifficultOption(SingingCharacter.intermediate),
        buildDifficultOption(SingingCharacter.professional),
      ],
    );
  }

  Container buildClearButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: ElevatedButton(
        //isExtended: true,
        child: Text(i("clear")),
        onPressed: () {
          setState(() {
            resetButton();
          });
        },
      ),
    );
  }

  Card buildTimerCard() {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        children: [
          buildTimeButtons(),
        ],
      ),
    );
  }

  Container buildObjectiveTable() {
    List<TableRow> lines = [];
    for (var it = 0; it < _objectives.length; it += 2) {
      lines.add(TableRow(children: [
        buildObjectiveItem(_objectives[it], _objectivesStates[it]),
        buildObjectiveItem(_objectives[it + 1], _objectivesStates[it + 1])
      ]));
    }
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Table(
        children: lines,
      ),
      // child: Table(
      //   children: [
      //     TableRow(children: [
      //       buildObjectiveItem(_emfReaderText, _emfReader),
      //       buildObjectiveItem(_ghostEventText, _ghostEvent),
      //     ]),
      //     TableRow(children: [
      //       buildObjectiveItem(_ghostPhotoText, _ghostPhoto),
      //       buildObjectiveItem(_saltFootprintText, _saltFootprint),
      //     ]),
      //     TableRow(children: [
      //       buildObjectiveItem(_sensorText, _motionSensor),
      //       buildObjectiveItem(_crucifixText, _crucifix),
      //     ]),
      //     TableRow(children: [
      //       buildObjectiveItem(_smudgeSticksText, _smudgeSticks),
      //       buildObjectiveItem(_candleText, _candle),
      //     ]),
      //     TableRow(children: [
      //       buildObjectiveItem(_parabolicMicrophoneText, _parabolicMicrofone),
      //       buildObjectiveItem(_scapeHuntText, _scapeHunt),
      //     ]),
      //     TableRow(children: [
      //       buildObjectiveItem(_smudgeSticksHuntText, _smudgeSticksHunt),
      //       buildObjectiveItem(_sanityBellow25Text, _sanityBellow25),
      //     ]),
      //   ],
      // ),
    );
  }

  Card buildGhostNameAndRespondCard() {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
        child: ListTile(
          title: TextField(
            controller: _textEditingController,
//            autocorrect: false,
            decoration: InputDecoration(labelText: i("ghost.name")),
            onSubmitted: (value) {
              saveObjectiveState();
            },
          ),
          trailing: ToggleButtons(
            children: <Widget>[
              Icon(Icons.person),
              Icon(Icons.people),
            ],
            isSelected: _selections,
            borderRadius: BorderRadius.circular(30),
            onPressed: (int index) {
              setState(() {
                _selections = List.generate(2, (_) => false);
                _selections[index] = true;
                saveObjectiveState();
              });
            },
          ),
        ),
      ),
    );
  }

  void changeDifficult(SingingCharacter value) {
    int time = ZERO_MINUTES;
    if (value == SingingCharacter.intermediate) {
      time = TWO_MINUTES;
    } else if (value == SingingCharacter.amateur) {
      time = FIVE_MINUTES;
    }
    setState(
      () {
        _difficult = value;
        _timerText = TimerText(_stopwatch, time);
      },
    );
    saveObjectiveState();
  }

  Row buildTimeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _timerText,
        Wrap(
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                handlePlayButton();
              },
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                handlePauseButton();
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                handleStopButton();
              },
            ),
          ],
        )
      ],
    );
  }

  Widget buildDifficultOption(SingingCharacter difficult) {
    String text = getDifficultName(difficult);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: _difficult == difficult ? Colors.blueAccent : Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 1),
        child: InkWell(
          onTap: () {
            changeDifficult(difficult);
          },
          child: Container(
            margin: EdgeInsets.all(15),
            child: Text(i(text)),
          ),
        ),
      ),
    );
  }

  String getDifficultName(SingingCharacter difficult) {
    String text = "";
    switch (difficult) {
      case SingingCharacter.amateur:
        text = "amateur";
        break;
      case SingingCharacter.intermediate:
        text = "intermediate";
        break;
      case SingingCharacter.professional:
        text = "professional";
        break;
    }
    return text;
  }

  Card buildObjectiveItem(Objective objective, bool selected) {
    return Card(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent : Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        duration: Duration(seconds: 1),
        child: ListTile(
          dense: true,
          title: Text(i(objective.name())),
          //leading: Icon(Icons.person),
          trailing: InkWell(
            child: Icon(Icons.help_outline),
            onTap: () {
              goToObjectiveDetail(objective);
            },
          ),
          onTap: () {
            setState(() {
              changeObjectiveState(objective);
            });
          },
        ),
      ),
    );
  }

  void goToObjectiveDetail(Objective objective) {
    if (objective != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ObjectiveDetail(objective)),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => buildAlertDialog(),
        barrierDismissible: false,
      );
    }
  }

  void resetButton() {
    _textEditingController.text = "";
    _selections = List.generate(2, (_) => false);
    _objectivesStates.forEach((key, _) {
      _objectivesStates[key] = false;
    });
    _difficult = SingingCharacter.amateur;
    handleStopButton();
    saveObjectiveState();
  }

  void changeObjectiveState(Objective objective) {
    var name = objective.name();
    _objectivesStates[name] = !_objectivesStates[name];
    /* if (objective == _emfReaderText) {
      _emfReader = !_emfReader;
    } else if (objective == _lowTemperatureText) {
      _lowTemperature = !_lowTemperature;
    } else if (objective == _dirtWaterText) {
      _dirtWater = !_dirtWater;
    } else if (objective == _ghostPhotoText) {
      _ghostPhoto = !_ghostPhoto;
    } else if (objective == _sensorText) {
      _motionSensor = !_motionSensor;
    } else if (objective == _crucifixText) {
      _crucifix = !_crucifix;
    } else if (objective == _ghostEventText) {
      _ghostEvent = !_ghostEvent;
    } else if (objective == _smudgeSticksText) {
      _smudgeSticks = !_smudgeSticks;
    } else if (objective == _saltFootprintText) {
      _saltFootprint = !_saltFootprint;
    } else if (objective == _candleText) {
      _candle = !_candle;
    } else if (objective == _parabolicMicrophoneText) {
      _parabolicMicrofone = !_parabolicMicrofone;
    } else if (objective == _scapeHuntText) {
      _scapeHunt = !_scapeHunt;
    } else if (objective == _smudgeSticksHuntText) {
      _smudgeSticksHunt = !_smudgeSticksHunt;
    } else if (objective == _sanityBellow25Text) {
      _sanityBellow25 = !_sanityBellow25;
    } */
    saveObjectiveState();
  }

  void saveObjectiveState() {
    String ghostRespond = "";
    if (_selections[0]) {
      ghostRespond = "alone";
    } else if (_selections[1]) {
      ghostRespond = "everyone";
    }
    var save = {
      "objectives": _objectivesStates,
      "ghostName": _textEditingController.text,
      "ghostRespond": ghostRespond,
      "difficult": getDifficultName(_difficult),
    };
    saveMissionState(save);
  }

  void handlePlayButton() {
    setState(() {
      if (!_stopwatch.isRunning) {
        _stopwatch.start();
      }
    });
  }

  void handlePauseButton() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      }
    });
  }

  void handleStopButton() {
    setState(() {
      _stopwatch.reset();
      _stopwatch.stop();
      _timerText = TimerText(_stopwatch,
          _difficult == SingingCharacter.amateur ? FIVE_MINUTES : TWO_MINUTES);
    });
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      content: Text("Sorry, this content is not yet available."),
      actions: <Widget>[
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      elevation: 24,
    );
  }
}
