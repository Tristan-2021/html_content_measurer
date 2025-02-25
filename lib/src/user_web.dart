import 'dart:html' as html; // Solo para Flutter Web

Future<Map<String, dynamic>> detectWebViewUserAgent() async {
  try {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    bool isAndroid = userAgent.contains("android");
    bool isIphone = userAgent.contains("iphone");

    bool isDWebView = false;

    // 1. Detectar APIs específicas de DWebView/DSBridge
    try {
      // Verificar si existe el objeto JS 'DWebView' o 'dsbridge'
      // isDWebView = false;
      //    isDWebView = html.window.hasProperty('DWebView') ||
      //              html.window.hasProperty('dsbridge');
      // print("Error en detección de APIs: $userAgent");

      // Si no se detecta, verificar mediante User-Agent
      if (!isDWebView) {
        isDWebView =
            userAgent.contains("dwebview") || userAgent.contains("dsbridge");
      }
    } catch (e) {
      print("Error en detección de APIs: $e");
    }

    return {"isAndroid": isAndroid, "userAgent": userAgent, "iphone": isIphone};
  } catch (e) {
    print("Error crítico: $e");
    return {"error": e.toString()};
  }
}
