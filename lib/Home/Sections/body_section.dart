import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Utils/colors.dart';

class BodySection extends StatefulWidget {
  const BodySection({Key? key}) : super(key: key);

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  PageController pageController = PageController(viewportFraction: 0.87);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 6,
          itemBuilder: (context,position){
        return _buildPageItem(position);
    }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children:[
        Container(
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.yellowColor,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://p2-ofp.static.pub/fes/cms/2021/04/28/odtbtgltop8fb3ytjpdy4orxz9a3l7232523.jpg',
                )
            )
        ),
      ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 150,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
            ),
          ),
        ),
      ]
    );
  }
}
