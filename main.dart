import 'package:flutter/material.dart';

// con este punto se empieza el "programa"
void main() {
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Método que construye la interfaz de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            '1390-22-8856',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        // Usamos CustomPaint para dibujar en el cuerpo de la aplicación
        body: CustomPaint(
          painter: MyCustomPainter(),
          child: Container(),
        ),
      ),
    );
  }
}

// Clase que extiende CustomPainter para dibujar formas personalizadas
class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offsetX = size.width / 2;
    final offsetY = size.height / 2;

    // Dibuja un cuadrado con un estilo
    final squarePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 7.0
      ..style = PaintingStyle.stroke;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(offsetX, offsetY - 255), width: 100, height: 100),
        squarePaint);

    // Dibuja una línea con otro estilo
    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(offsetX - 120, offsetY - 180),
        Offset(offsetX + 120, offsetY - 180), linePaint);

    // Dibuja un círculo con otro estilo
    final circlePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(offsetX, offsetY -100), 50, circlePaint);

    // Dibuja un círculo con solo el borde con otro estilo
    final borderCirclePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(offsetX, offsetY + 40), 60, borderCirclePaint);

    // Dibuja un cuadrado con texto adentro con otro estilo
    final textSquarePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(offsetX, offsetY + 180), width: 130, height: 100),
        textSquarePaint);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Melissa Vargas',
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(offsetX - 55, offsetY + 170));
// Dibuja una línea curva con otro estilo
    final curvePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 7.0
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(offsetX - 150, offsetY + 250) // Punto de inicio
      ..quadraticBezierTo(
          offsetX, // Punto de control en el centro
          offsetY + 350, // Ajusta la "altura" del punto de control
          offsetX + 150, // Punto final
          offsetY + 250); // Ajusta la posición final de la curva
    canvas.drawPath(path, curvePaint);
  }

  // Método que determina si el lienzo debe ser repintado
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}