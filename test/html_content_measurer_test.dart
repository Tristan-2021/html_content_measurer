import 'dart:html' as html;

import 'package:html_content_measurer/html_content_measurer.dart';
import 'package:test/test.dart';

//Todo: correr el test con:  dart test -p chrome
void main() {
  group('measureHtmlContent', () {
    test('should correctly measure the height of HTML content', () async {
      const testContent = '<div style="height: 200px; "></div>';

      // Simular el comportamiento del iframe
      // html.window.onMessage.listen((event) {
      //   if (event.data is Map && event.data['type'] == 'height') {
      //     html.window.postMessage({'type': 'height', 'height': '200'}, '*');
      //   }
      // });

      // Llamar a la función y verificar el resultado
      final height = await measureHtmlContent(testContent);
      expect(height, equals(232.0),
          reason:
              'La altura debe coincidir con el valor enviado en postMessage');
    });

    test('should handle height measurement after delay', () async {
      const testContent = '<div style="height: 200px;"></div>';

      // Simular respuesta retrasada del iframe
      Future.delayed(Duration(milliseconds: 500), () {
        html.window.postMessage({'type': 'height', 'height': '200'}, '*');
      });

      final height = await measureHtmlContent(testContent);
      expect(height, equals(232.0),
          reason:
              'Debe devolver la altura total incluyendo el padding (200px + 32px de padding)');
    });

    test('should only process first height message', () async {
      const testContent = '<div style="height: 200px;"></div>';

      // Enviar múltiples mensajes de altura
      Future.delayed(Duration(milliseconds: 100), () {
        html.window.postMessage({'type': 'height', 'height': '200'}, '*');
      });

      Future.delayed(Duration(milliseconds: 200), () {
        html.window.postMessage({'type': 'height', 'height': '300'}, '*');
      });

      final height = await measureHtmlContent(testContent);
      expect(height, equals(232.0),
          reason: 'Debe usar solo el primer valor de altura recibido');
    });
  });
}
