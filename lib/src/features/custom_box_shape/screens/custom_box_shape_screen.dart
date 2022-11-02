import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constants/app_colors.dart';

class CustomBoxShapeScreen extends StatelessWidget {
  const CustomBoxShapeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 100.0;
    const width = 400.0;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: Container(
          // height: 200,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          // color: AppColors.grey,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: Stack(
                    children: [
                      CustomPaint(
                        painter: BNBCustomPainter(),
                        size: const Size(width, height),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.green.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const Text(
                              '10k',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(width: 75 * 0.5),
                          SizedBox(
                            height: 70,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('GIOITHIEU',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('Giảm giá 12k cho đơn hàng'),
                                  SizedBox(height: 5),
                                  Text(
                                    'Kết thúc: 31/12/2021',
                                    style: TextStyle(color: AppColors.grey),
                                  ),
                                ]),
                          ),
                          const Spacer(),
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppColors.blue, width: 2)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    double sizeCircle = 10;
    path.moveTo(0, sizeCircle); // Start
    path.arcToPoint(Offset(sizeCircle, 0),
        radius: Radius.circular(sizeCircle), clockwise: true);
    path.lineTo(size.width * 0.3 - sizeCircle, 0);
    path.arcToPoint(Offset(size.width * 0.3 + sizeCircle, 0),
        radius: Radius.circular(sizeCircle), clockwise: false);
    path.lineTo(size.width - sizeCircle, 0);
    path.arcToPoint(Offset(size.width, sizeCircle),
        radius: Radius.circular(sizeCircle), clockwise: true);
    path.lineTo(size.width, size.height - sizeCircle);
    path.arcToPoint(Offset(size.width - sizeCircle, size.height),
        radius: Radius.circular(sizeCircle), clockwise: true);
    path.lineTo(size.width * 0.3 + sizeCircle, size.height);
    path.arcToPoint(Offset(size.width * 0.3 - sizeCircle, size.height),
        radius: Radius.circular(sizeCircle), clockwise: false);
    path.lineTo(sizeCircle, size.height);
    path.arcToPoint(Offset(0, size.height - sizeCircle),
        radius: Radius.circular(sizeCircle), clockwise: true);

    canvas.drawPath(path, paint);
    final linePaint = Paint()..color = Colors.black;
    const int dashHeight = 4;
    const int dashSpace = 4;
    double x = size.width * 0.3;
    double y = sizeCircle + size.height * 0.1;

    while (y < size.height * 0.9 - sizeCircle) {
      canvas.drawLine(Offset(x, y), Offset(x, y + dashHeight), linePaint);
      y += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
