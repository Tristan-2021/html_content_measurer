import 'dart:async';
import 'dart:html' as html;

Future<double> measureHtmlContent(String htmlContent) async {
  final completer = Completer<double>();
  int counter = 0;

  final iframe = html.IFrameElement()
    ..srcdoc = """
        <html>
        <head>
          <style>
            body {
              margin: 0;
              padding: 0;
              overflow: hidden;
              font-family: Arial, sans-serif;
            }
            .content-wrapper {
            
              height: 100%;
              padding: 16px;
              box-sizing: border-box;

            }
          </style>
          <script>
            function sendHeightToFlutter() {
              const height = document.body.scrollHeight; 
              window.parent.postMessage({ type: 'height', height: height }, "*");
            }
            window.addEventListener('load', sendHeightToFlutter);
            window.addEventListener('resize', sendHeightToFlutter);
          </script>
        </head>
        <body>
          <div class="content-wrapper">
            $htmlContent
          </div>
        </body>
        </html>
      """
    ..style.border = 'none'
    ..style.width = '100%'
    ..style.height = '100%';

  final subscription = html.window.onMessage.listen((event) {
    if (event.data is Map) {
      switch (event.data['type']) {
        case 'height':
          final height = double.tryParse(event.data['height'].toString());
          if (height != null && counter == 0) {
            counter++;
            completer.complete(height);
          }
          break;
      }
    }
  });

  html.document.body?.append(iframe);

  // Limpieza después del delay
  Future.delayed(Duration(milliseconds: 1200), () {
    subscription.cancel();
    iframe.remove();
  });

  return completer.future;
}
