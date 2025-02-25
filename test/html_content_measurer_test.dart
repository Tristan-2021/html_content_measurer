// import 'dart:html' as html;

// import 'package:html_content_measurer/html_content_measurer.dart';
// import 'package:test/test.dart';

// void main() {
//   group('measureHtmlContent', () {
//     test('should correctly measure the height of HTML content', () async {
//       const testContent = '<div style="height: 200px;"></div>';

//       final height = await measureHtmlContent(testContent);
//       expect(height, equals(232.0));
//     });

//     test('should handle height measurement after delay', () async {
//       const testContent = '<div style="height: 200px;"></div>';

//       final height = await measureHtmlContent(testContent);
//       expect(height, equals(232.0));
//     });

//     test('should only process first height message', () async {
//       const testContent = '<div style="height: 200px;"></div>';

//       // Enviar mensajes extra (deberían ser ignorados)
//       Future.delayed(Duration(milliseconds: 100), () {
//         html.window.postMessage({'type': 'height', 'height': '300'}, '*');
//       });

//       final height = await measureHtmlContent(testContent);
//       expect(height, equals(232.0));
//     });
//   });
// }
