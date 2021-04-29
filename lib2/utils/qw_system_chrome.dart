enum QWDeviceOrientationMask {
  unknown,
  portaitUp,
  portraitDown,
  landscapeLeft,
  landscapeRight,
  landscape,
}

extension QWDeviceOrientationMaskExtension on QWDeviceOrientationMask {
  int get valueOf {
    switch (this) {
      case QWDeviceOrientationMask.unknown:
        return 1;
      case QWDeviceOrientationMask.portaitUp:
        return 1 << 1;
      case QWDeviceOrientationMask.portraitDown:
        return 1 << 2;
      case QWDeviceOrientationMask.landscapeLeft:
        return 1 << 3;
      case QWDeviceOrientationMask.landscapeRight:
        return 1 << 4;
      case QWDeviceOrientationMask.landscape:
        return QWDeviceOrientationMask.landscapeLeft.valueOf | QWDeviceOrientationMask.landscapeRight.valueOf;
      default:
        return 0;
    }
  }
}
