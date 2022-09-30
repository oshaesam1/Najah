import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najah/Home_Screen/piechart_card.dart';
import 'package:najah/notes_cubit/notes_states.dart';

import '../notes_cubit/notes_cubit.dart';

class AdminHome extends StatelessWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color myBlack=Color(0xff181818);

    return Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
          backgroundColor: Colors.black26,elevation: 0.0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Hi, Ahmed 👋",style: GoogleFonts.poppins(color: Colors.white,
                            fontSize: 30,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(height: 50,),
                 Column(
                        children: [
                          PieChartSample3()
                        ],
                      ),
                    SizedBox(height: 50,),
              Container(
                width: 500,
                height: 200,
                child: Card(
                  color: myBlack.withOpacity(0.6),
                  elevation: 30,
                  child: Center(
                    
                    child: Column(
                      children: [
                      Text('❞',style: TextStyle(fontSize: 60,color:CupertinoColors.white),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '"Fit is not a destination. It is a way of life."',
                            //'Fitness is not about being better than someone else. It is about being better than you used to be.',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20,
                                color: Color(0xFFFFCE2B),

                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          color:CupertinoColors.white,
                          width: 80,
                          height: 2,
                        ),],
                    ),
                  ),

                ),
              ),
             SizedBox(height: 20,)
              ],

                ),
              ),
            ),
          ),

      );

  }
}
