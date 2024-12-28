import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  Gratitude ({Key? key, required this.radioGroupValue}) : super (key: key);

  @override
  _GratitudeState createState () => _GratitudeState ();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = [];
  late String _selectedGratitude;
  late int _radioGroupValue;

  void _radioOnChange (int index) {
    setState ( () {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList [index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState () {
    super.initState();

    _gratitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue = widget.radioGroupValue >= 0 && widget.radioGroupValue < _gratitudeList.length
        ? widget.radioGroupValue
        : 0;
    _selectedGratitude = _gratitudeList[_radioGroupValue];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio<int>(
                value:0,
                groupValue: _radioGroupValue,
                onChanged: (int? index) => _radioOnChange(index!),
              ),
              Text('Family'),
              Radio<int>(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (int? index) => _radioOnChange(index!),
              ),
              Text('Friends'),
              Radio<int>(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (int? index) => _radioOnChange(index!),
              ),
              Text('Coffee'),
            ],
          ),
        ),
      ),
    );
  }
}