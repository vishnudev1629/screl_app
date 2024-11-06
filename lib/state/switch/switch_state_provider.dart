import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_campaign_app/state/switch/switch_state_notifier.dart';

// customerAudience switch
final customerAudienceProvider = StateNotifierProvider<BooleanStateNotifier, bool>(
  (ref) => BooleanStateNotifier(),
);

// runOncePerCustomer switch
final runOncePerCustomerProvider = StateNotifierProvider<BooleanStateNotifier, bool>(
  (ref) => BooleanStateNotifier(),
);
