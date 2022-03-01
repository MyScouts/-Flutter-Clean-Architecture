import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_demo/app/constants.dart';
import 'package:flutter_demo/presentation/base/resources/color_manager.dart';
import 'package:flutter_demo/presentation/base/resources/font_manager.dart';
import 'package:flutter_demo/presentation/base/resources/strings_manager.dart';
import 'package:flutter_demo/presentation/base/resources/styles_manager.dart';
import 'package:flutter_demo/presentation/base/resources/values_manager.dart';

enum StateRendererType {
  // POPUP STATES
  popupLoadingState,
  popupErrorState,
  popupSuccess,
  // FULL SCREEN STATES
  fullScreenLoadingState,
  fullScreenErrorState,
  contentScreenState, // THE UI OF THE SCREEN
  emptyScreenState // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryActionFunction;
  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      String? message,
      String? title,
      required this.retryActionFunction})
      : message = message ?? AppStrings.loading.tr(),
        title = title ?? Constants.empty,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [_getLoadingWidget()]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          // _getAnimatedImage(LottieAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.accept.tr(), context)
        ]);
      case StateRendererType.popupSuccess:
        return _getPopUpDialog(context, [
          // _getAnimatedImage(LottieAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(AppStrings.accept.tr(), context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsInColumn([_getLoadingWidget(), _getMessage(message)]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsInColumn([
          // _getAnimatedImage(LottieAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain.tr(), context)
        ]);
      case StateRendererType.contentScreenState:
        return Container();
      case StateRendererType.emptyScreenState:
        return _getItemsInColumn([_getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
        // height: AppSize.s100,
        // width: AppSize.s100,
        // child: Lottie.asset(
        //   animationName,
        //   width: AppSize.s120,
        //   height: AppSize.s120,
        // ),
        );
  }

  Widget _getLoadingWidget() {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Center(
        child: Text(AppStrings.loading.tr()),
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Text(
          message,
          style: getMediumStyle(color: AppColor.black, fontSize: FontSize.s16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType ==
                    StateRendererType.fullScreenErrorState) {
                  retryActionFunction
                      ?.call(); // to call the API function again to retry
                } else {
                  Navigator.of(context)
                      .pop(); // popup state error so we need to dismiss the dialog
                }
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
