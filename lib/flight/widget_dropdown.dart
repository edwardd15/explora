import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DropDownButtonTransit extends StatefulWidget {
  DropDownButtonTransit({Key key}) : super(key: key);

  @override
  _DropDownButtonTransitState createState() => _DropDownButtonTransitState();
}

class _DropDownButtonTransitState extends State<DropDownButtonTransit> {
  String dropdownValue = '1 Transit';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: DropdownButton<String>(
        isDense: true,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        iconSize: 24,
        elevation: 16,
        focusColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['1 Transit', '2 Transit', '3 Transit', '4 Transit']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownButtonDepartureTime extends StatefulWidget {
  DropDownButtonDepartureTime({Key key}) : super(key: key);

  @override
  _DropDownButtonDepartureTimeState createState() =>
      _DropDownButtonDepartureTimeState();
}

class _DropDownButtonDepartureTimeState
    extends State<DropDownButtonDepartureTime> {
  String dropdownValue = '00:00 - 06:00 (Dawn)';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: DropdownButton<String>(
        isDense: true,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        iconSize: 24,
        elevation: 16,
        focusColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          '00:00 - 06:00 (Dawn)',
          '06:00 - 12:00 (Morning)',
          '12:00 - 18.00 (Afternoon)',
          '18:00 - 24.00 (Night)'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownButtonArrivalTime extends StatefulWidget {
  DropDownButtonArrivalTime({Key key}) : super(key: key);

  @override
  _DropDownButtonArrivalTimeState createState() =>
      _DropDownButtonArrivalTimeState();
}

class _DropDownButtonArrivalTimeState extends State<DropDownButtonArrivalTime> {
  String dropdownValue = '00:00 - 06:00 (Dawn)';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: DropdownButton<String>(
        isDense: true,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        iconSize: 24,
        elevation: 16,
        focusColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          '00:00 - 06:00 (Dawn)',
          '06:00 - 12:00 (Morning)',
          '12:00 - 18.00 (Afternoon)',
          '18:00 - 24.00 (Night)'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class DropDownButtonAirlines extends StatefulWidget {
  DropDownButtonAirlines({Key key}) : super(key: key);

  @override
  _DropDownButtonAirlinesState createState() => _DropDownButtonAirlinesState();
}

class _DropDownButtonAirlinesState extends State<DropDownButtonAirlines> {
  String dropdownValue = 'Air Asia X';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: DropdownButton<String>(
        isDense: true,
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.blue,
        ),
        iconSize: 24,
        elevation: 16,
        focusColor: Colors.white,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Air Asia X', 'Air Asia Y', 'Air Asia Z']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class SliderPrice extends StatefulWidget {
  @override
  _SliderPriceState createState() => _SliderPriceState();
}

class _SliderPriceState extends State<SliderPrice> {
  final oCcy = new NumberFormat("#,###", "en_US");
  RangeValues _values = RangeValues(0, 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Price   :',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                Text(
                    'Rp' +
                        oCcy.format((_values.start * 1000000)) +
                        ' - Rp' +
                        oCcy.format(_values.end * 1000000),
                    style: TextStyle(fontSize: 16)),
              ]),
        ),
        RangeSlider(
          values: _values,
          inactiveColor: Colors.white,
          onChanged: (RangeValues values) {
            setState(() {
              _values = values;
            });
          },
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Rp0', style: TextStyle(fontSize: 16)),
              Text('Rp1.000.000', style: TextStyle(fontSize: 16))
            ])
      ],
    );
  }
}

class FacilitiesRadio extends StatefulWidget {
  @override
  _FacilitiesRadioState createState() => _FacilitiesRadioState();
}

class _FacilitiesRadioState extends State<FacilitiesRadio> {
  String _selectedFacilty;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 24,
              child: Row(
                children: <Widget>[
                  Radio(
                      value: 'Earliest Departure',
                      groupValue: _selectedFacilty,
                      onChanged: (val) {
                        setState(() {
                          _selectedFacilty = val;
                        });
                      }),
                  Text('Earliest Departure')
                ],
              ),
            ),
            Container(
              height: 24,
              child: Row(
                children: <Widget>[
                  Radio(
                      value: 'Latest Departure',
                      groupValue: _selectedFacilty,
                      onChanged: (val) {
                        setState(() {
                          _selectedFacilty = val;
                        });
                      }),
                  Text('Latest Departure')
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 24,
              child: Row(
                children: <Widget>[
                  Radio(
                      value: 'Earliest Arrival',
                      groupValue: _selectedFacilty,
                      onChanged: (val) {
                        setState(() {
                          _selectedFacilty = val;
                        });
                      }),
                  Text('Earliest Arrival')
                ],
              ),
            ),
            Container(
              height: 24,
              child: Row(
                children: <Widget>[
                  Radio(
                      value: 'Latest Arrival',
                      groupValue: _selectedFacilty,
                      onChanged: (val) {
                        setState(() {
                          _selectedFacilty = val;
                        });
                      }),
                  Text('Latest Arrival')
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
