import 'package:flutter/material.dart';
import 'package:school_app/repository/JurusanRepository.dart';

class TambahJurusan extends StatelessWidget {
  final _namaController = TextEditingController();
  final _kuotaController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final JurusanRepository jurusanRepository = JurusanRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nama Jurusan'),
                  controller: _namaController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Kuota'),
                  controller: _kuotaController,
                  keyboardType: TextInputType.number,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.22,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      onPressed: () async {
                        bool result = await jurusanRepository.addJurusan(
                          kuota: int.parse(_kuotaController.text),
                          name: _namaController.text,
                        );
                        var text = "failed";
                        if (result) text = "success";

                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                            'add $text',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.22,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
