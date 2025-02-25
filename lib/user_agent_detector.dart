/// A Calculator.
library;

export 'src/user_stup.dart'
    if (dart.library.html) 'src/user_web.dart'
    if (dart.library.io) 'src/user_mobile.dart';
