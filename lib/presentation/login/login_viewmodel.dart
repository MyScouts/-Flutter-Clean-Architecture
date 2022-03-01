import 'package:flutter_demo/app/app_prefs.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/data/network/repository/auth_repository.dart';
import 'package:flutter_demo/domain/usecase/login_usecase.dart';
import 'package:flutter_demo/presentation/base/resources/routes_manager.dart';
import 'package:flutter_demo/presentation/base/resources/routes_manager.gr.dart';
import 'package:flutter_demo/presentation/base/state_renderer/freezed_data_classes.dart';
import 'package:flutter_demo/presentation/base/state_renderer/state_renderer/state_renderer.dart';
import 'package:flutter_demo/presentation/base/state_renderer/state_renderer/state_renderer_impl.dart';
import 'package:flutter_demo/presentation/base/view_model/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  var loginViewObject = LoginViewObject("", "", false);

  final LoginUseCase _loginUseCase = LoginUseCase(getIt<AuthRepository>());
  final RoutesManager _appRouter = getIt<RoutesManager>();
  final AppPreferences _appPreferences = getIt<AppPreferences>();

  @override
  void init() {
    inputState.add(ContentState());
  }

  @override
  signIn() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(LoginUseCaseInput(
            loginViewObject.userName, loginViewObject.password)))
        .fold(
            (failure) => inputState.add(
                ErrorState(StateRendererType.popupErrorState, failure.message)),
            (data) {
      inputState.add(ContentState());
      _handleLoginSuccess();
    });
  }

  void _handleLoginSuccess() {
    _appPreferences.setIsUserLoggedIn();
    _appRouter.replaceNamed(RouteName.tabbar);
  }

  @override
  setPassword(String password) {
    loginViewObject = loginViewObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    loginViewObject = loginViewObject.copyWith(userName: userName);
  }
}

abstract class LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);

  signIn();
}

abstract class LoginViewModelOutputs {}
