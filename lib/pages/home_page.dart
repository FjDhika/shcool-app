import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/bloc/login_bloc/bloc/authenticate_bloc.dart';
import 'package:school_app/pages/list_siswa_page.dart';
import 'package:school_app/components/menu_button.dart';
import 'package:school_app/pages/tambah_jurusan.dart';
import 'package:school_app/pages/tambah_siswa.dart';

class HomePage extends StatelessWidget {
  final String role;
  HomePage({this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home | Home Hub'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MenuButton(
              colors: Colors.blue,
              label: "Register",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TambahSiswa(),
                    ));
              },
            ),
            MenuButton(
              colors: Colors.blue,
              label: "List Siswa",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListSiswa(),
                    ));
              },
            ),
            (role == "ADMIN")
                ? MenuButton(
                    colors: Colors.blue,
                    label: "Tambah Jurusan",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TambahJurusan(),
                          ));
                    },
                  )
                : null,
            Padding(
              padding: EdgeInsets.fromLTRB(34.0, 20.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.16,
                child: RaisedButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticateBloc>(context).add(LoggedOut());
                  },
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
    );
  }
}
