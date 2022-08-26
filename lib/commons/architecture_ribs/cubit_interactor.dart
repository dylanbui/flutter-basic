/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 26/08/2022 - 16:13
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_interactor.dart';
import 'note_router.dart';

typedef CubitInteractor<T extends DbNoteRoutable, State> = CubitPresenterInteractor<T, DbNoteEmptyPresenter, State>;

abstract class CubitPresenterInteractor<T extends DbNoteRoutable, P extends DbNotePresentable, State> extends Cubit<State> implements DbNoteInteractor<T, P> {

  @override
  T? router;

  @override
  P? presenter;

  CubitPresenterInteractor(super.initialState);

  void pop() {
    router?.newPop();
  }

}