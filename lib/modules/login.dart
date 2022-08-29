import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/register.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

import '../layout/shoplayout.dart';
import '../shared/network/local/cache_helper.dart';

class ShopLogin extends StatelessWidget {
  ShopLogin({Key? key}) : super(key: key);

  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),

      child: BlocConsumer<AppCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState  ) {
            if (state.loginModel.status == true) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              showToast(
                text: state.loginModel.message!,
                state: ToastStates.SUCCESS,
              );
              CacheHelper.setData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                naviagteToAndReplace(
                  context,
                  ShopLayout(),
                );
              });
            }
          }
        },
        builder: (context, state) {
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
                              return 'please enter your email address';                            }
                          },
                          iconPre: Icons.email,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defualtInput(
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()){
                              AppCubit.get(context).userLogin(
                                  Email: EmailController.text,
                                  Password: PasswordController.text);
                            }
                          },
                            text: 'Password',
                            controller: PasswordController,
                            inputType: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                            },

                            iconPre: Icons.password,
                            isPassword: AppCubit.get(context).isPassword,
                            issuffix: true,
                            iconSuff: AppCubit.get(context).suffix,
                            suffPressed: () {
                            AppCubit.get(context).changePasswordVisibility();
                            }

                        ),
                        SizedBox(height: 15),

                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) =>
                              defualtButton(

                                test: ()
                                {
                                  if (formKey.currentState!.validate()){
                                    AppCubit.get(context).userLogin(
                                        Email: EmailController.text,
                                        Password: PasswordController.text);
                                  }

                                },
                                text: 'LOGIN',
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account ? '),
                            defaultTextButton(

                                onPressed: () {
                                  naviagteToAndReplace(
                                      context, ShopRegisterScreen());
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
        },

      ),
    );
  }
}
