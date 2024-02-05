import 'package:flutter_test/flutter_test.dart';
import 'package:icons/classes.dart';

void main() {
  test('Should return the lenght between 2 points', () {
    const origin = Offset(0.0, 0.0);
    const point = Offset(2, 2);

    final hipotenusa = lengthBetween2Points(origin, point).toStringAsFixed(2);

    expect(hipotenusa, '2.83');
  });

  test('Should return a cartesian point', () {
    const double vectorLength = 0.5;
    const double radianAngle = 180.0;

    final a = polarToCartesianPoint(
      originDistance: vectorLength,
      radianAngle: radianAngle,
    );

    expect(a, const Offset(-0.29923003452892905, -0.4005763178669152));
  });
}
