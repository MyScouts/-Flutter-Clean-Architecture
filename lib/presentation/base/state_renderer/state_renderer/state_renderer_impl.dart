import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_demo/app/constants.dart';
import 'package:flutter_demo/presentation/base/resources/strings_manager.dart';
import 'package:flutter_demo/presentation/base/state_renderer/state_renderer/state_renderer.dart';

class DialogShowing {
  static bool isShowing = false;
}

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

class LoadingState extends FlowState {
  final StateRendererType stateRendererType;
  final String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading.tr();

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.popupSuccess;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.fullScreenLoadingState
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.fullScreenErrorState
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                retryActionFunction: retryActionFunction);
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      case SuccessState:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          dismissDialog(context);

          // show popup
          showPopUp(context, StateRendererType.popupSuccess, getMessage(),
              title: AppStrings.success.tr());
          // return content ui of the screen
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // if (_isThereCurrentDialogShowing(context)) {
      //   Navigator.of(context, rootNavigator: true).pop(true);
      // }
      if (_isThereCurrentDialogShowing(context)) {
        DialogShowing.isShowing = false;
        if (Navigator.canPop(context)) {
          // Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop(true);
        }
      }
    });
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true && DialogShowing.isShowing;

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = Constants.empty}) {
    DialogShowing.isShowing = true;
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
          stateRendererType: stateRendererType,
          message: message,
          title: title,
          retryActionFunction: () {},
        ),
      ),
    );
  }
}
