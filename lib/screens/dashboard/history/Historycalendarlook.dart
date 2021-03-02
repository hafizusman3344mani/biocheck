import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Historycalendarlook extends StatelessWidget {
  Historycalendarlook({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: Stack(
        children: <Widget>[



          Transform.translate(
            offset: Offset(4.5, 140.1),
            child:
                // Adobe XD layer: 'Calendar Grid' (group)
                SizedBox(
              width: 359.0,
              height: 295.0,
              child: Stack(
                children: <Widget>[

                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(107.0, 42.7, 38.6, 57.3),
                    size: Size(359.0, 295.3),
                    pinTop: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: [
                            const Color(0x66ffffff),
                            const Color(0xffffffff)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0d000000),
                            offset: Offset(0, 3),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(232.7, 14.7, 38.6, 214.0),
                    size: Size(359.0, 295.3),
                    pinRight: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Transform.rotate(
                      angle: 1.5708,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              const Color(0x66ffffff),
                              const Color(0xffffffff)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x0d000000),
                              offset: Offset(0, 3),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(105.0, 138.6, 38.6, 156.7),
                    size: Size(359.0, 295.3),
                    pinBottom: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: [
                            const Color(0xffffffff),
                            const Color(0x66ffffff)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0d000000),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(33.9, 68.5, 38.6, 106.4),
                    size: Size(359.0, 295.3),
                    pinLeft: true,
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Transform.rotate(
                      angle: -1.5708,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              const Color(0x66ffffff),
                              const Color(0xffffffff)
                            ],
                            stops: [0.0, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x0d000000),
                              offset: Offset(0, 3),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(98.0, 93.0, 52.6, 52.6),
                    size: Size(359.0, 295.3),
                    fixedWidth: true,
                    fixedHeight: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, -1.0),
                          end: Alignment(1.95, 2.03),
                          colors: [
                            const Color(0xff7ff7b4),
                            const Color(0xff3dc27c)
                          ],
                          stops: [0.0, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff3dc27c),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
