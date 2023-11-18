import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class MyArrowEdgeRenderer extends ArrowEdgeRenderer {
  static const double myArrowLength = 20; // Increase from 10 to 20

  @override
  List<double> drawTriangle(
      Canvas canvas, Paint paint, double x1, double y1, double x2, double y2) {
    var angle = (atan2(y2 - y1, x2 - x1) + pi);
    var x3 = (x2 + myArrowLength * cos((angle - ARROW_DEGREES)));
    var y3 = (y2 + myArrowLength * sin((angle - ARROW_DEGREES)));
    var x4 = (x2 + myArrowLength * cos((angle + ARROW_DEGREES)));
    var y4 = (y2 + myArrowLength * sin((angle + ARROW_DEGREES)));
    trianglePath.moveTo(x2, y2); // Top;
    trianglePath.lineTo(x3, y3); // Bottom left
    trianglePath.lineTo(x4, y4); // Bottom right
    trianglePath.close();
    canvas.drawPath(trianglePath, paint);

    // calculate centroid of the triangle
    var x = (x2 + x3 + x4) / 3;
    var y = (y2 + y3 + y4) / 3;
    var triangleCentroid = [x, y];
    trianglePath.reset();
    return triangleCentroid;
  }
}
