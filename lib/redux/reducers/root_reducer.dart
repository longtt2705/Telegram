import 'package:redux/redux.dart';
import 'package:telegram/redux/app_state.dart';

import 'friend_request_reducer.dart';

final rootReducer = combineReducers<AppState>([friendRequestReducer]);
