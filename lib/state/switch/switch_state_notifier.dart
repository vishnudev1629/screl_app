import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooleanStateNotifier extends StateNotifier<bool> {
  BooleanStateNotifier() : super(false); 

  void toggle() {
    state = !state;
  }

  void set(bool value) {
    state = value;
  }
}
