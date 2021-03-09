import 'package:flutter/material.dart';
import 'package:medico/prediction_logic/constants.dart';
import 'package:medico/prediction_logic/prediction_core.dart';

class SymptomSelect extends StatefulWidget {
  @override
  _SymptomSelectState createState() => _SymptomSelectState();
}

class _SymptomSelectState extends State<SymptomSelect> {
  final List<String> _symptoms = symptomsToLabel.keys.toList();
  List _searchedSymptoms = symptomsToLabel.keys.toList();
  Map<String, bool> _isChecked =
      Map.fromIterable(symptomsToLabel.keys.toList(), value: (item) => false);
  String _appBarValue = 'Select Disease';

  Future<void> getDisease() async {
    var _confirmedsymptomsList =
        _symptoms.where((element) => _isChecked[element]).toList();
    if (0 < _confirmedsymptomsList.length &&
        _confirmedsymptomsList.length < 18) {
      String disease =
          await PredictionCore().computeDiseaseName(_confirmedsymptomsList);
      this._showMyDialog(disease);
    }
  }

  void search(String value) {
    setState(() {
      _searchedSymptoms = _symptoms
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<void> _showMyDialog(String value) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Disease Predicted'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('It seems like you are suffering from $value'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var core = PredictionCore();
    core.testFunc();
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarValue),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () => this.getDisease(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Diseases Here',
                contentPadding: EdgeInsets.only(left: 10),
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w100,
                ),
              ),
              onChanged: (value) {
                this.search(value);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchedSymptoms.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: _isChecked[_searchedSymptoms[index]],
                    onChanged: (value) {
                      setState(() {
                        _isChecked[_searchedSymptoms[index]] = value;
                      });
                    },
                    title: Text('${_searchedSymptoms[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
