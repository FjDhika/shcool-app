import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_app/components/siswa_form.dart';
import 'package:school_app/model/siswaModel.dart';
import 'package:school_app/apiutils/api_connection.dart';

class ListSiswaComponent extends StatefulWidget {
  @override
  _ListSiswaState createState() => _ListSiswaState();
}

class _ListSiswaState extends State<ListSiswaComponent> {
  List<SiswaModel> data = List();

  Future<bool> getData() async {
    var resp = await getSiswaData();
    print("reload");
    setState(() {
      data = resp;
    });
    return true;
  }

  void onDelete(int index) async {
    var res = await deleteSiswa(data[index].id.toString());

    if (res)
      getData();
    else
      print("failed");
  }

  void onClick(SiswaModel siswa) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
                  key: _scaffoldKey,
                  body: SingleChildScrollView(
                    child: SiswaForm(
                      siswa: siswa,
                    ),
                  ),
                )));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onClick(data[index]);
            },
            child: Container(
              height: 75,
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data[index].nama,
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 40,
                    ),
                    onPressed: () {
                      print("click");
                      onDelete(index);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
