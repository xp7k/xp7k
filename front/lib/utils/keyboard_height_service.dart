import 'package:flutter/foundation.dart';

/// Service that provides keyboard height notifier
/// Height is detected by isolated MediaQuery widget (works on all platforms)
/// This avoids rebuilds in Stack by isolating MediaQuery to a separate widget
class KeyboardHeightService {
  static final KeyboardHeightService _instance = KeyboardHeightService._internal();
  factory KeyboardHeightService() => _instance;
  KeyboardHeightService._internal();

  /// Notifier for keyboard height (0 when closed, detected height when open)
  /// Updated by isolated MediaQuery detection widget
  final ValueNotifier<double> heightNotifier = ValueNotifier<double>(0.0);

  bool _isInitialized = false;

  /// Initialize the service
  void initialize() {
    if (_isInitialized) return;
    _isInitialized = true;
    print('[KeyboardHeightService] Initialized - waiting for MediaQuery detection');
  }

  /// Dispose the service
  void dispose() {
    if (!_isInitialized) return;
    heightNotifier.dispose();
    _isInitialized = false;
  }
}
