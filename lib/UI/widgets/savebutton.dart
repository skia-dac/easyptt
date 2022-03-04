import 'package:easypage/UI/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonsave extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButtonsave({Key? key ,required this.label,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onTap,
        child:Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:bluishClr
            ),
            child: Align(
                alignment: Alignment.center,child: Text(
                label,
                style:const TextStyle(
                  color:Colors.white,
                )
            )
            )
        )
    );
  }
}
