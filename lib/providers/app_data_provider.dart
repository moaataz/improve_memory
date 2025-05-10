import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDataProvider extends StateNotifier<SharedPreferences> {
  AppDataProvider(super.state);

  int get wpm {
    return state.getInt('wpm') ?? 20;
  }

  void setWpm(int value) {
    final newState = state;
    newState.setInt('wpm', value);
    state = newState;
  }
}

late StateNotifierProvider<AppDataProvider, SharedPreferences> appDataProvider;
