import 'package:flutter/material.dart';
import 'package:school_app/components/list_siswa.dart';

class ListSiswa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListSiswaComponent(),
        ),
      ),
    );
  }
}
