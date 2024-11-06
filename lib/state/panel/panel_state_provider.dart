
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_campaign_app/state/panel/panel_state_notifier.dart';

final panelVisibilityProvider = StateNotifierProvider<PanelVisibilityNotifier, bool>((ref) {
  return PanelVisibilityNotifier();
});
