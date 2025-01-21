/// A Calculator.
library;

export 'src/measure_stub.dart'
    if (dart.library.html) 'src/measure_web.dart'
    if (dart.library.io) 'src/measure_mobile.dart';
