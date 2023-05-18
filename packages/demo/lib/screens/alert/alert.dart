import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';
import 'package:vts_component/components/alert/vts_alert.dart';
import 'package:vts_component/components/alert/typing.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showAlert = false;
  bool _showErorrOutLineAlert = true;
  bool _showErrorFillAlert = true;
  bool _showWarningOutLineAlert = true;
  bool _showWarningFillAlert = true;
  bool _showSuccessOutLineAlert = true;
  bool _showSuccessFillAlert = true;
  bool _showInfoFillAlert = true;
  bool _showInfoOutLineAlert = true;
  bool _showCustomeAlert = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DemoAppbar(title: 'Alert'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            DemoBox(
              title: 'ALERT TRONG FORM',
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  ///Error out line
                  _showAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.ERROR_OUTLINE,
                          title: 'Error!',
                          subtitle: 'Invalid ID or password',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 3),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Color.fromRGBO(203, 0, 43, 1),
                              )),
                        )
                      : Container(),
                  loginForm(context),

                  ///Error out line
                  _showErorrOutLineAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.ERROR_OUTLINE,
                          title: 'Error!',
                          subtitle: 'Error message.',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 5),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showErorrOutLineAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Color.fromRGBO(203, 0, 43, 1),
                              )),
                        )
                      : Container(),
                  //Success out line
                  _showSuccessOutLineAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.SUCCESS_OUTLINE,
                          title: 'Successful!',
                          subtitle: 'Successful message.',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 6),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showSuccessOutLineAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Color.fromRGBO(0, 171, 118, 1),
                              )),
                        )
                      : Container(),
                  //Warning out line
                  _showWarningOutLineAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.WARNING_OUTLINE,
                          title: 'Warning!',
                          subtitle: 'Warning message.',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 7),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showWarningOutLineAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Color.fromRGBO(219, 168, 22, 1),
                              )),
                        )
                      : Container(),
                  //Info out line
                  _showInfoOutLineAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.INFO_OUTLINE,
                          title: 'Info!',
                          subtitle: 'Info message.',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 8),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showInfoOutLineAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Color.fromRGBO(42, 177, 235, 1),
                              )),
                        )
                      : Container(),
                ],
              ),
            ),
            DemoBox(
              title: 'ALERT TRONG FORM',
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  //Success fill
                  _showSuccessFillAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.SUCCESS_FILL,
                          title: 'Successful!',
                          subtitle: 'Your message has been sent successfully.',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 9),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showSuccessFillAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              )),
                        )
                      : Container(),
                  // Error fill
                  _showErrorFillAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.ERROR_FILL,
                          title: 'Error!',
                          subtitle: 'Invalid login ID or Password',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 10),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showErrorFillAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              )),
                        )
                      : Container(),
                  //Warning fill
                  _showWarningFillAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.WARNING_FILL,
                          title: 'Warning!',
                          subtitle: 'Invalid login ID or Password',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 11),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showWarningFillAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              )),
                        )
                      : Container(),
                  //Info fill
                  _showInfoFillAlert
                      ? VTSAlert(
                          alertType: VTSAlertType.INFO_FILL,
                          title: 'Info!',
                          subtitle: 'Invalid login ID or Password',
                          borderRadius: 5,
                          animationDuration: Duration(seconds: 12),
                          closeCustomIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showInfoFillAlert = false;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              )),
                        )
                      : Container(),
                ],
              ),
            ),
            DemoBox(
              title: 'DEMO ALERT',
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  // Custom Alert
                  _showCustomeAlert
                      ? VTSAlertCustom(
                          title: "Congratulations!",
                          titleAlignment: Alignment.center,
                          subtitle: "You have successfully...!",
                          subtitleAlignment: Alignment.center,
                          topBarAlignment: Alignment.center,
                          border: Border.all(color: Colors.white),
                          shadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          animationDuration: Duration(seconds: 12),
                          topBar: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 30),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2, color: Colors.green),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.check,
                                  size: 40,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          bottomBarAlignment: Alignment.bottomCenter,
                          bottomBar: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _showCustomeAlert = false;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: VTSColors.PRIMARY_1,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ))),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Form loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            lable("Email"),
            SizedBox(
              height: 10,
            ),
            InputText(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (val) {},
              validator: (email) {
                if (email == null || email.isEmpty) {
                  setState(() {
                    _showAlert = true;
                  });
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            lable("Password"),
            SizedBox(
              height: 10,
            ),
            InputText(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onChanged: (val) {},
              validator: (password) {
                if (password == null || password.isEmpty) {
                  setState(() {
                    _showAlert = true;
                  });
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            VTSButton(
              text: "Login",
              width: double.infinity,
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget lable(String lable) {
    return Row(
      children: [
        Text(
          lable,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "*",
          style: TextStyle(color: Colors.red, fontSize: 16),
        )
      ],
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({
    required this.onChanged,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
  });
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        hintText: hintText,
        errorStyle: TextStyle(height: 0, color: Colors.transparent),
        hintStyle: TextStyle(
          fontSize: 16,
          color: Color(0xFF969A9D),
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black, width: .5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black, width: .5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black, width: .5)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red, width: .5),
        ),
      ),
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
