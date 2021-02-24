import 'package:flutter/material.dart';
import 'package:school_app/apiutils/api_connection.dart';
import 'package:school_app/components/jurusan_dropdown.dart';
import 'package:school_app/model/siswaModel.dart';
import 'package:school_app/repository/UserRepository.dart';

class SiswaForm extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final SiswaModel siswa;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _noTlpController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  // final TextEditingController _jurusanIdController = TextEditingController();
  final TextEditingController _namaOrtuController = TextEditingController();
  final TextEditingController _sekolahAsalController = TextEditingController();
  var value;

  SiswaForm({this.scaffoldKey, this.siswa});

  final UserRepository userRepository = UserRepository();

  void setValue() {
    _namaController.text = siswa.nama;
    _noTlpController.text = siswa.noTlp;
    _alamatController.text = siswa.alamat;
    _namaOrtuController.text = siswa.namaOrtu;
    _sekolahAsalController.text = siswa.sekolahAsal;
  }

  @override
  Widget build(BuildContext context) {
    if (siswa != null) {
      setValue();
    }
    return Container(
      child: Form(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                controller: _namaController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'alamat'),
                controller: _alamatController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'No Telp'),
                controller: _noTlpController,
                keyboardType: TextInputType.number,
              ),
              JurusanDropdown(
                callback: (newValue) => {value = newValue},
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Orangtua'),
                controller: _namaOrtuController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sekolah Asal'),
                controller: _sekolahAsalController,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.22,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: RaisedButton(
                    onPressed: () async {
                      SiswaModel siswa = SiswaModel(
                        id: this.siswa != null ? this.siswa.id : null,
                        jurusanId: value != null ? value.toString() : null,
                        nama: _namaController.text.toString(),
                        alamat: _alamatController.text.toString(),
                        namaOrtu: _namaOrtuController.text.toString(),
                        noTlp: _noTlpController.text.toString(),
                        sekolahAsal: _sekolahAsalController.text.toString(),
                      );
                      bool result = (siswa != null
                          ? await updateSiswa(siswa)
                          : await createSiswa(siswa));
                      var text = "failed";
                      if (result) text = "success";

                      scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text(
                          siswa != null ? 'add $text' : 'update $text',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    },
                    child: Text(
                      siswa != null ? 'Update' : 'Add',
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
    );
  }
}
