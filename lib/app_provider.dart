import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_state.dart';

final isLoginProvider = StateProvider((ref) {
  return FFAppState().isLogin;
});
