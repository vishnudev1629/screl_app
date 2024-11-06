import 'package:flutter_riverpod/flutter_riverpod.dart';

class PanelVisibilityNotifier extends StateNotifier<bool> {
  PanelVisibilityNotifier() : super(false);

  void togglePanel() {
    state = !state;
  }

  void setPanelVisible(bool isVisible) {
    state = isVisible;
  }
}
