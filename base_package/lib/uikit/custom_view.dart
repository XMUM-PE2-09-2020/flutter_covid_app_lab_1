import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText(this.data,
      {@required this.gradient,
      this.style,
      this.textAlign = TextAlign.left,
      this.maxLines = 1});

  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        data,
        maxLines: maxLines,
        textAlign: textAlign,
        style: (style == null)
            ? TextStyle(color: Colors.white)
            : style.copyWith(color: Colors.white),
      ),
    );
  }
}

/// 绘制三角形
 
class TrianglePainter extends CustomPainter{
 
  Color color; //填充颜色
  Paint _paint;//画笔
  Path _path;  //绘制路径
  double angle;//角度
 
  TrianglePainter(this.color){
   _paint = Paint()
       ..strokeWidth = 1.0 //线宽
       ..color = color
       ..isAntiAlias = true;
   _path = Path();
  }
 
  @override
  void paint(Canvas canvas, Size size) {
    final baseX = size.width * 0.5;
    final baseY = size.height * 0.5;
    // double y =  0.5 * baseY;
    double y = 0;
    //起点
    _path.moveTo(baseX - 0.86 * baseX, y);
    _path.lineTo(baseY, 1.5 * baseY - y);
    _path.lineTo(baseX + 0.86 *baseX, y);
    canvas.drawPath(_path,_paint);
  }
 
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
 
}
