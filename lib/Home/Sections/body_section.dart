import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Utils/colors.dart';
import 'package:food_ordering_app/Widgets/big_text.dart';
import 'package:food_ordering_app/Widgets/icon_text_widget.dart';
import 'package:food_ordering_app/Widgets/small_text.dart';

class BodySection extends StatefulWidget {
  const BodySection({Key? key}) : super(key: key);

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
   pageController.addListener(() {
     setState(() {
       _currentValue = pageController.page!;
     });
   });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.green,
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 6,
              itemBuilder: (context,position){
            return _buildPageItem(position);
        }),
        ),
        new DotsIndicator(
          dotsCount: 6,
          position: _currentValue,
          decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeColor: AppColors.mainColor,
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currentValue.floor()){
      var currScale = 1-(_currentValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currentValue.floor()+1){
      var currScale = _scaleFactor+(_currentValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currentValue.floor()-1){
      var currScale = _scaleFactor+(_currentValue-index-1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else {
      var currScale = _scaleFactor;
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children:[
          Container(
          height: 220,
          margin: EdgeInsets.symmetric(horizontal: 10),
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
              height: 130,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Chinese Food'),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children:
                            List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15, ))
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: '4.8'),
                        SizedBox(width: 10,),
                        SmallText(text: '1200'),
                        SizedBox(width: 10,),
                        SmallText(text: 'comments')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        IconAndText(icon: Icons.circle_sharp, text: 'Normal', iconcolor: AppColors.iconColor1,),
                        SizedBox(width: 20,),
                        IconAndText(icon: Icons.location_on, text: '1.7km', iconcolor: AppColors.mainColor,),
                        SizedBox(width: 20,),
                        IconAndText(icon: Icons.access_time_rounded, text: '32min', iconcolor: AppColors.iconColor1,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
