import 'package:flutter/material.dart';
import 'package:school_app/components/siswa_form.dart';

class TambahSiswa extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SiswaForm(scaffoldKey: _scaffoldKey),
      ),
    );
  }
}
