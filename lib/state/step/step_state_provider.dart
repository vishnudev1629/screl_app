import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_campaign_app/state/step/step_state_notifier.dart';

final stepProvider = StateNotifierProvider<StepStateNotifier, int>((ref) {
  return StepStateNotifier();
});
