import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PieChartSample3 extends StatefulWidget {
   PieChartSample3({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;
  Color myBlack=Color(0xff181818);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Card(

      color: myBlack.withOpacity(0.6),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex =
                                  pieTouchResponse.touchedSection!.touchedSectionIndex;
                            });
                          }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
           SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Column(
                   children: [
                     CircleAvatar(
                       backgroundColor: Colors.amber,radius: 7,),
                     SizedBox(height: 5,),
                     CircleAvatar(
                       backgroundColor: Colors.orange,radius: 7,),
                     SizedBox(height: 5,),
                     CircleAvatar(
                       backgroundColor: const Color(0xff0293ee),radius: 7,),

                   ],
                 ),
                 Column(
                   children: [
                     Text('Coaches',style: GoogleFonts.poppins(
                         fontSize:14,fontWeight:FontWeight.w500,color: Colors.white
                     ),),
                     Text('Members',style: GoogleFonts.poppins(
                         fontSize:14,fontWeight:FontWeight.w500,color: Colors.white
                     ),),
                     Text(' Nutritionists',style: GoogleFonts.poppins(
                         fontSize:14,fontWeight:FontWeight.w500,color: Colors.white
                     ),)

                   ],
                 )
               ],
             ),
           )
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/icons/nutritionist.svg',
              size: widgetSize,
              borderColor: const Color(0xff0293ee),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/icons/coach.svg',
              size: widgetSize,
              borderColor: const Color(0xfff8b250),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/icons/person.svg',
              size: widgetSize,
              borderColor: Colors.orange,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw 'Oh no';
      }
    });
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
      this.svgAsset, {
        Key? key,
        required this.size,
        required this.borderColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}