import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Widgets/big_text.dart';
import '../../Widgets/small_text.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 30, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(text: 'Sudan', color: AppColors.mainColor,),
              Row(
                children: [
                  SmallText(text: 'Khartoum', color: Colors.black54,),
                  Icon(Icons.arrow_drop_down_rounded)
                ],
              )
            ],
          ),
          Center(
            child: Container(
              width: 45,
              height: 45,
              child: Icon(Icons.search, color: Colors.white,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
