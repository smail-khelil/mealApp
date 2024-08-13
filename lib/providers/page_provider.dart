import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNotifier extends StateNotifier<int> {
  // this is constructor to initialize the state
  PageNotifier()
      : super(0);

  void setPage(int index) {
    state = index;
  }


}

final pageProvider = StateNotifierProvider<PageNotifier, int>((_) => PageNotifier());

