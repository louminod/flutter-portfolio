import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'dart:html' as html;

const kTileHeight = 50.0;

const Color _purpleColor = Color(0xFF750FF7);
const completeColor = Color(0xFF750FF7);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  int _processIndex = 3;

  final _processes = [
    'EETAA',
    'ETRS',
    'CNAM',
    'EFREI',
    'School of life',
  ];

  final _logos = [
    "assets/images/eetaa.png",
    "assets/images/armee.png",
    "assets/images/cnam.jpeg",
    "assets/images/efrei.jpg",
  ];

  final _dates = [
    "2012 - 2014",
    "2015",
    "2016 - 2019",
    "2019 - 2022",
    "2022",
  ];

  final _descriptions = [
    "French Air & Space Force school",
    "French Military High school of transmissions",
    "National Conservatory of Arts and Crafts",
    "Efrei Paris engineering school of digital technologies",
  ];

  final _links = [
    "https://eetaa722.fr",
    "https://www.defense.gouv.fr/english/node_64/l-armee-de-terre/le-niveau-divisionnaire/commandement-sic-des-forces/ecole-des-transmissions",
    "https://www.cnam.eu/site-en/",
    "https://eng.efrei.fr",
  ];

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.horizontal,
        connectorTheme: ConnectorThemeData(space: 30.0, thickness: 5.0),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / _processes.length,
        oppositeContentsBuilder: (context, index) {
          if (index < _logos.length) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Image.asset(
                _logos[index],
                width: 80.0,
              ),
            );
          } else {
            return Container();
          }
        },
        contentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(_processes[index], style: TextStyle(fontWeight: FontWeight.bold, color: getColor(index))),
                SizedBox(height: 10),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_dates[index], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                        if (index < _logos.length) SizedBox(height: 20),
                        if (index < _logos.length)
                          Text(_descriptions[index], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,letterSpacing: 1), textAlign: TextAlign.center),
                        if (index < _logos.length) SizedBox(height: 20),
                        if (index < _logos.length)
                          InkWell(onTap: () => html.window.open(_links[index], "_blank"), child: Icon(Icons.search, color: _purpleColor)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        indicatorBuilder: (_, index) {
          var color;
          var child;
          if (index == _processIndex) {
            color = inProgressColor;
            child = Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else if (index < _processIndex) {
            color = completeColor;
            child = Icon(
              Icons.check,
              color: Colors.white,
              size: 15.0,
            );
          } else {
            color = todoColor;
          }

          if (index <= _processIndex) {
            return Stack(
              children: [
                CustomPaint(
                  size: Size(30.0, 30.0),
                  painter: _BezierPainter(
                    color: color,
                    drawStart: index > 0,
                    drawEnd: index < _processIndex,
                  ),
                ),
                DotIndicator(
                  size: 30.0,
                  color: color,
                  child: child,
                ),
              ],
            );
          } else {
            return Stack(
              children: [
                CustomPaint(
                  size: Size(15.0, 15.0),
                  painter: _BezierPainter(
                    color: color,
                    drawEnd: index < _processes.length - 1,
                  ),
                ),
                OutlinedDotIndicator(
                  borderWidth: 4.0,
                  color: color,
                ),
              ],
            );
          }
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            if (index == _processIndex) {
              final prevColor = getColor(index - 1);
              final color = getColor(index);
              List<Color> gradientColors;
              if (type == ConnectorType.start) {
                gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
              } else {
                gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)!];
              }
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                ),
              );
            } else {
              return SolidLineConnector(
                color: getColor(index),
              );
            }
          } else {
            return null;
          }
        },
        itemCount: _processes.length,
      ),
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius, radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius, radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.drawStart != drawStart || oldDelegate.drawEnd != drawEnd;
  }
}
