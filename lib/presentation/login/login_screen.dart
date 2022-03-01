import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/app/di/get_it.dart';
import 'package:flutter_demo/presentation/base/resources/routes_manager.dart';
import 'package:flutter_demo/presentation/base/resources/strings_manager.dart';
import 'package:flutter_demo/presentation/base/state_renderer/state_renderer/state_renderer_impl.dart';
import 'package:flutter_demo/presentation/login/login_viewmodel.dart';
import 'package:flutter_demo/app/validator/auth_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginViewModel _viewModel = LoginViewModel();
  final AuthValidator _authValidator = getIt<AuthValidator>();
  @override
  void initState() {
    _emailController
        .addListener(() => _viewModel.setUserName(_emailController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  Widget _getContentWidget() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    AppStrings.login.tr(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _emailController,
                    decoration:
                        InputDecoration(hintText: AppStrings.email.tr()),
                    validator: _authValidator.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration:
                        InputDecoration(hintText: AppStrings.password.tr()),
                    validator: _authValidator.password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      child: Text(AppStrings.login.tr()),
                      onPressed: _viewModel.signIn,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppStrings.or.tr(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent)),
                      onPressed: () {
                        AutoRouter.of(context).pushNamed(RouteName.register);
                      },
                      child: Text(
                        AppStrings.register.tr(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (BuildContext context, AsyncSnapshot<FlowState> snapshot) {
          return snapshot.data?.getScreenWidget(
                  context, _getContentWidget(), _viewModel.signIn) ??
              _getContentWidget();
        },
      ),
    );
  }
}
