import 'package:flutter/widgets.dart';

import 'classes.dart';

class TestCoordinateLogo extends StatelessWidget {
  final double size;
  const TestCoordinateLogo({
    super.key,
    this.size = 400,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: TestCoordinateLogoPainter(),
    );
  }
}

class TestCoordinateLogoPainter extends CustomPainter {
  final Color? color;

  TestCoordinateLogoPainter({
    super.repaint,
    this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.stroke;
    DimensionConvert dim = DimensionConvert(size: size);

    final c = Offset(size.width / 2, size.height / 2);

    if (color != null) {
      paint.color = color!;
    } else {
      paint.color = const Color(0xff000000);
    }

    final oval = Rect.fromLTRB(0, 0, size.width, size.height);

    final ponteiroPos2 = c +
        polarToCartesianPoint(
          originDistance: 100,
          radianAngle: degreesToRadian(0),
        );

    const angle = 0.0;

    final ponteiroPos3 = polarToCartesianPoint(
      origin: c,
      originDistance: 0,
      radianAngle: degreesToRadian(angle),
    );

    final circlePath = Path()..addOval(oval);
    canvas.drawPath(circlePath, paint);
    canvas.drawLine(c, ponteiroPos2, paint);
    canvas.save();
    canvas.translate(ponteiroPos3.dx, ponteiroPos3.dy);
    canvas.rotate(degreesToRadian(angle));
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          dim.w(00.00),
          dim.h(-02.50),
          dim.w(50.0),
          dim.h(2.50),
          bottomRight: Radius.circular(dim.h(5)),
          topRight: Radius.circular(dim.h(5)),
        ),
        paint);
    canvas.restore();
    canvas.drawCircle(c, 10, paint);
    canvas.drawCircle(c, 100, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
