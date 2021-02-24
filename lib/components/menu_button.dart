import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Color colors;
  final String label;
  final void Function() onTap;

  MenuButton({this.colors, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.0,
          bottom: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0), color: colors),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
