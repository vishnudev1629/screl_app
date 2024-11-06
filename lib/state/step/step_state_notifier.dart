import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepStateNotifier extends StateNotifier<int> {
  StepStateNotifier() : super(1); 

  void changeStep() {
    state = (state % 5) + 1; 
  }
}
