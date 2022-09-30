import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najah/Home_Screen/admin_home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/onboarding_model.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'Communicate  with \n your Coach and Nutritionist',
      body: 'Make it easy for you to select your coaches\n and select your nutrition plan',
    ),
    BoardingModel(
      image: 'assets/images/onboard_3.png',
      title: 'Personalize and enjoy \n your workout ',
      body: "Have your own  profile\n contains (booked session –workout summary- music playlist ",
    ),
    BoardingModel(
      image: 'assets/images/onboard_2.png',
      title: 'Get ready!!',
      body: 'Select your plans and enjoy our Application now',
    ),
  ];

  bool isLast = false;

  void submit() {

    if (isLast) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context)=>AdminHome()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.grey[50],
        elevation: 0.0,
      actions: [
        TextButton(onPressed: (){
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context)=>AdminHome()), (route) => false);
        },
          child: Text('SKIP',
      style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold
      ),),)],),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                  itemBuilder: (context,index)=>BoardingItem(boarding[index])
              ,itemCount: 3,),
            ),
            SizedBox(height: 40
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: WormEffect(activeDotColor: Colors.amber),
                   count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton.extended(backgroundColor: Colors.amber,
                    onPressed: (){
                      if (isLast)
                      {
                        submit();
                      }
                  else {boardController.nextPage(
                        duration: Duration(
                        milliseconds: 750,
                    ),
                      curve: Curves.fastLinearToSlowEaseIn,);
                    }}
                    ,label:Text("NEXT"),icon: Icon(Icons.arrow_forward_ios))
              ],
            )
            , SizedBox(height: 30
            ),
          ],
        ),
      ) ,

    );
  }
  Widget BoardingItem(BoardingModel model)=>
      Column(
   // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image(
            image: AssetImage(model.image),),
        ),
      ),

      Expanded(
        flex: 1,
        child:Column(
      children: [
        Text(model.title,maxLines:2,textAlign:TextAlign.center,style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold,color: Colors.amber
        ),),
        SizedBox(
        height: 18,
      ),
    Text(model.body,style: TextStyle(
            fontSize:18,
        ),),

  ]))
  ]);
}
