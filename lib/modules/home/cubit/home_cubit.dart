import 'package:flutter/material.dart';

import '../../../core/utils/emit_catch.dart';

part 'home_state.dart';

class HomeCubit extends FWCubit<HomeState> {
  HomeCubit() : super(HomeData());
}
