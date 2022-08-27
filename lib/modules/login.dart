import 'package:flutter/material.dart';
import 'package:shop_app/modules/register.dart';
import 'package:shop_app/shared/components/components.dart';

class ShopLogin extends StatelessWidget {
  ShopLogin({Key? key}) : super(key: key);

  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'login now to browse our hot offers',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  defualtInput(
                    text: 'Email Address',
                    controller: EmailController,
                    inputType: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        print('Email Address mustn\'t be empty');
                      }
                    },
                    iconPre: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defualtInput(
                      text: 'Password',
                      controller: PasswordController,
                      inputType: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          print('Password mustn\'t be empty');
                        }
                      },
                      onTap: () {},
                      iconPre: Icons.password,
                      isPassword: true,
                      issuffix: true,
                      iconSuff: Icons.remove_red_eye,
                      suffPressed: () {}),
                  defualtButton(
                    test: () {},
                    text: 'LOGIN',
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ? '),
                      defualtButton(
                          test: () {
                            naviagteToAndReplace(context, RegisterScreen());
                          },
                          text: 'Register'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
