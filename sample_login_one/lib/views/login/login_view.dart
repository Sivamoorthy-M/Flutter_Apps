import 'package:flutter/material.dart';
import 'package:localpath/resource/AppContextExtension.dart';
import 'package:localpath/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';
import '../custom_widget/bottom_button_widget.dart';
import '../custom_widget/textfield_widget.dart';
import '../custom_widget/topwave_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginViewModel model = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (BuildContext context) => model,
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, _) {
          return _loginTextViews(context, viewModel);
        },
      ),
    );
  }

  Widget _loginTextViews(BuildContext context, LoginViewModel viewModel) {
    final topWaveWidgetSize = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: context.resources.color.colorWhite,
      body: Stack(
        children: <Widget>[
          Container(
            height: topWaveWidgetSize.height - 200,
            color: context.resources.color.colorMediumBlue,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -topWaveWidgetSize.height / 5 : 0.0,
            child: Stack(
              children: [
                TopWaveWidget(
                  size: topWaveWidgetSize,
                  yOffset: topWaveWidgetSize.height / 2.5,
                  color: context.resources.color.colorWhite,
                ),
                _topImages(context),
                _loginScreenTitle(context),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.resources.dimension.margin30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: context.resources.strings.emailHintText,
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: viewModel.isValid ? Icons.check : null,
                  onChanged: (value) {
                    viewModel.isValidEmail(value);
                  },
                ),
                SizedBox(
                  height: context.resources.dimension.defaultMargin,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldWidget(
                      hintText: context.resources.strings.passwordHintText,
                      obscureText: !viewModel.isVisible,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: viewModel.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: onloginViewWidgetsPressed,
                    ),
                    SizedBox(
                      height: context.resources.dimension.defaultMargin,
                    ),
                    Text(
                      context.resources.strings.forgotPasswordButtonTitle,
                      style: TextStyle(
                        color: context.resources.color.colorMediumBlue,
                      ),
                    ),
                    _loginButtonView(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButtonView(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.resources.dimension.defaultMargin),
        BottomButtonWidget(
            title: context.resources.strings.loginButtonTitle,
            hasBorder: false),
        SizedBox(height: context.resources.dimension.defaultMargin),
        BottomButtonWidget(
            title: context.resources.strings.signinButtonTitle,
            hasBorder: true
        ),
        SizedBox(height: context.resources.dimension.bigMargin),
      ],
    );
  }

  Widget _topImages(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: <Widget> [
        const SizedBox(height: 50),
        Image(
          image: AssetImage(context.resources.image.light_1),
          width: 80,
          height: 200,
          ),
          SizedBox(
            width: context.resources.dimension.margin30
          ),
          Image(
          image: AssetImage(context.resources.image.light_2),
          width: 80,
          height: 150,
          ),
          SizedBox(
            width: context.resources.dimension.margin30
          ),
          Image(
          image: AssetImage(context.resources.image.clock),
          width: 80,
          height: 150,
          ),
      ],
    );
  }

  Widget _loginScreenTitle(BuildContext context) {
    return Positioned(
      left: 160,
      top: 220,
      child: Text(
        context.resources.strings.loginScreen,
        style: TextStyle(
          color: context.resources.color.colorWhite,
          fontSize: context.resources.dimension.fontSize30,
          fontWeight: FontWeight.w900,
          ),
          ),
      );
  }

  onloginViewWidgetsPressed(String field) {
    switch (field) {
      case "Password":
        model.isVisible = !model.isVisible;
        break;
      default:
    }
  }
}
