import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_scan/r_scan.dart';

const PHOTO = 'qr_photo';
const LIGHT = 'qr_light';

class Qrcode extends StatefulWidget {
  final Function(String) function;
  Qrcode(this.function);

  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  RScanCameraController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      List<RScanCameraDescription> rScanCameras = await availableRScanCameras();
      _controller = RScanCameraController(
          rScanCameras[0], RScanCameraResolutionPreset.high);

      await _controller.initialize();

      setState(() {
        _controller.addListener(() {
          final result = _controller.result;
          dealResult(result);
        });
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double boxHeight = width * 2 / 3;
    double top = (height - boxHeight) / 2;
    double bottom = top + boxHeight;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            _controller == null
                ? Container()
                : ScanImageView(
                    child: RScanCamera(_controller),
                  ),
            heard(),
            Positioned(
                left: 40,
                top: bottom + 40,
                child: Container(
                  alignment: Alignment.center,
                  height: 36,
                  width: MediaQuery.of(context).size.width - 80,
                  child: Text(
                    '将二维码放入取景框中即可自动扫描',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18)),
                ))
          ],
        ));
  }

  Widget heard() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: 50,
      child: Row(
        children: <Widget>[
          backIcon(),
          Expanded(child: Container()),
          actionButton(PHOTO),
          actionButton(LIGHT)
        ],
      ),
    );
  }

  Widget backIcon() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Image.asset(
          'assest/images/qr_popback.png',
          scale: 5,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget actionButton(String name) {
    return GestureDetector(
        child: Container(
            margin: EdgeInsets.only(right: 20),
            child: Image.asset(
              'assest/images/$name.png',
              scale: 5,
            )),
        onTap: () async {
          if (name == PHOTO) {
            final pickedFile =
                await ImagePicker().getImage(source: ImageSource.gallery);
            final byte = await pickedFile.readAsBytes();
            final result = await RScan.scanImageMemory(byte);
            dealResult(result);
          } else {
            bool flash = await _controller.getFlashMode();
            _controller.setFlashMode(!flash);
          }
        });
  }

  void dealResult(RScanResult result) {
    if (result == null) {
      return;
    }
    if (widget.function != null) {
      widget.function(result?.message ?? '');
      if (ModalRoute.of(context).isActive) {
        Navigator.of(context).pop();
      }
    }
  }
}

///--------------------------------------扫描图层---------------------------------///
class ScanImageView extends StatefulWidget {
  final Widget child;

  const ScanImageView({Key key, this.child}) : super(key: key);

  @override
  _ScanImageViewState createState() => _ScanImageViewState();
}

class _ScanImageViewState extends State<ScanImageView>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) => CustomPaint(
              foregroundPainter:
                  _ScanPainter(controller.value, Colors.white, Colors.green),
              child: widget.child,
              willChange: true,
            ));
  }
}

class _ScanPainter extends CustomPainter {
  final double value;
  final Color borderColor;
  final Color scanColor;
  final Color cornerColor = Color(0xFF00ff00);

  _ScanPainter(this.value, this.borderColor, this.scanColor);

  Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    //背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Colors.black.withOpacity(0.3); //背景色
    double width = size.width;
    double height = size.height;

    double boxWidth = size.width * 2 / 3;
    double boxHeight = boxWidth;

    double leftb = (width - boxWidth) / 2;
    double topb = (height - boxHeight) / 2;
    final rectb = Rect.fromLTWH(leftb, topb, boxWidth, boxHeight);
    final path = Path.combine(PathOperation.reverseDifference,
        Path()..addRect(rectb), Path()..addRect(Offset.zero & size));
    canvas.drawPath(path, paint);

    if (_paint == null) {
      initPaint();
    }

    double left = (width - boxWidth) / 2;
    double top = (height - boxHeight) / 2;
    double bottom = top + boxHeight;
    double right = left + boxWidth;
    _paint.color = borderColor;
    final rect = Rect.fromLTWH(left, top, boxWidth, boxHeight);
    canvas.drawRect(rect, _paint);

    _paint.strokeWidth = 4;
    _paint.color = cornerColor;
    Path path1 = Path()
      ..moveTo(left, top + 10)
      ..lineTo(left, top)
      ..lineTo(left + 10, top);
    canvas.drawPath(path1, _paint);
    Path path2 = Path()
      ..moveTo(left, bottom - 10)
      ..lineTo(left, bottom)
      ..lineTo(left + 10, bottom);
    canvas.drawPath(path2, _paint);
    Path path3 = Path()
      ..moveTo(right, bottom - 10)
      ..lineTo(right, bottom)
      ..lineTo(right - 10, bottom);
    canvas.drawPath(path3, _paint);
    Path path4 = Path()
      ..moveTo(right, top + 10)
      ..lineTo(right, top)
      ..lineTo(right - 10, top);
    canvas.drawPath(path4, _paint);

    _paint.color = scanColor;

    _paint.strokeWidth = 1;

    final scanRect = Rect.fromLTWH(
        left + 10, top + 10 + (value * (boxHeight - 20)), boxWidth - 20, 1);

    _paint.shader = LinearGradient(colors: <Color>[
      cornerColor.withOpacity(0.2),
      cornerColor,
      cornerColor.withOpacity(0.2),
    ], stops: [
      0.0,
      0.5,
      1,
    ]).createShader(scanRect);
    canvas.drawRect(scanRect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void initPaint() {
    _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
  }
}
