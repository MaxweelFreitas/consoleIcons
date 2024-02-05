import 'dart:math';
import 'dart:ui';

class DimensionConvert {
  final Size size;

  DimensionConvert({
    this.size = const Size(100, 100),
  });

  double w(double value) {
    final result = (value / 100) * size.width;
    return result;
  }

  double h(double value) {
    final result = (value / 100) * size.height;
    return result;
  }
}

/// first order function that converts degress to radians
double degreesToRadian(double value) => value * pi / 180;

/// **genOffsetList** - Generates a list of Offsets based on the parameters
///  below
///
/// ```dart
/// List<List<double>> pointsList, DimensionConvert dim
/// ```
///
/// Where **pointsList** represents the list of points necessary to form the
/// desired polygon and **dim** represents the class that proportionally scales
/// the dimensions of the points
List<Offset> genOffsetList(
  List<List<double>> pointsList,
  DimensionConvert dim,
) {
  List<Offset> returnListPoint = [];
  for (var point in pointsList) {
    returnListPoint.add(
      Offset(
        dim.w(point[0]),
        dim.h(point[1]),
      ),
    );
  }
  return returnListPoint;
}

List<Offset> genMirroredList(
    List<List<double>> pointsList, DimensionConvert dim) {
  List<Offset> offsetPoints = genOffsetList(pointsList, dim);
  List<Offset> finalListMirrored =
      genOffsetList(pointsList.reversed.toList(), dim);
  var listaTeste = [];
  List<Offset> returnListPoint = [];
  for (var reversePoint in finalListMirrored) {
    listaTeste.add(Offset(dim.h(100) - reversePoint.dx, reversePoint.dy));
    returnListPoint.add(Offset(dim.h(100) - reversePoint.dx, reversePoint.dy));
  }

  offsetPoints.addAll(returnListPoint);
  return offsetPoints;
}

class PolarCoordinate {
  final double vectorLength;
  final double radianAngle;

  PolarCoordinate({
    required this.vectorLength,
    required this.radianAngle,
  });
}

PolarCoordinate cartesiantoPolarCoordinate(Offset origin, Offset point) {
  return PolarCoordinate(vectorLength: 0, radianAngle: 0);
}

Offset polarToCartesianPoint({
  Offset origin = Offset.zero,
  double originDistance = 0.0,
  double radianAngle = 0.0,
}) {
  final dx = originDistance * cos(radianAngle);
  final dy = originDistance * sin(radianAngle);
  return origin + Offset(dx, dy);
}

double lengthBetween2Points(Offset origin, Offset point) {
  final dx = point.dx - origin.dx;
  final dy = point.dy - origin.dy;
  final h = sqrt(pow(dx, 2) + pow(dy, 2));

  return h;
}
