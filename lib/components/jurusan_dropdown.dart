import 'package:flutter/material.dart';
import 'package:school_app/apiutils/api_connection.dart';
import 'package:school_app/model/jurusanModel.dart';

class JurusanDropdown extends StatefulWidget {
  final void Function(dynamic newValue) callback;

  JurusanDropdown({this.callback});

  @override
  _JurusanDropdownState createState() => _JurusanDropdownState();
}

class _JurusanDropdownState extends State<JurusanDropdown> {
  int mySelection;
  List<JurusanModel> data = [JurusanModel(namaJurusan: "Jurusan")];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<bool> getData() async {
    var resp = await getJurusanAvail();
    setState(() {
      resp.add(JurusanModel(namaJurusan: "Jurusan"));
      data = resp;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: mySelection,
      icon: Icon(
        Icons.arrow_downward,
        size: 10,
      ),
      items: data
          .map((e) => DropdownMenuItem(
                child: Text(e.namaJurusan),
                value: e.id,
              ))
          .toList(),
      onChanged: (newValue) {
        print(newValue);
        setState(() {
          mySelection = newValue;
        });
        widget.callback(newValue);
      },
    );
  }
}
