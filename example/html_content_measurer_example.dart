import 'package:html_content_measurer/html_content_measurer.dart';

void main() async {
  const testContent = '<div style="height: 200px;"></div>';
  var awesome = await measureHtmlContent(testContent);
  print('awesome: 232: $awesome');
}
