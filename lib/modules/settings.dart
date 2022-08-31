import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';

import '../shared/components/constant.dart';
import '../shared/cubit/states.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController()  ;
   TextEditingController emailController = TextEditingController()  ;
   TextEditingController phoneController = TextEditingController()  ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,ShopLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var data =  cubit.userModel!.data;

        nameController.text = data!.name.toString();
        emailController.text = data.email.toString();
        phoneController.text=  data.phone.toString();

        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children:
                [
                  if(state is ShopLoadingUpdateUserState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtInput(
                    controller: nameController,
                    inputType: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'name must not be empty';
                      }

                      return null;
                    },
                    text: 'Name',
                    iconPre: Icons.person,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtInput(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      }

                      return null;
                    },
                    text: 'Email Address',
                    iconPre: Icons.email,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtInput(
                    controller: phoneController,
                    inputType: TextInputType.phone,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'phone must not be empty';
                      }

                      return null;
                    },
                    text: 'Phone',
                    iconPre: Icons.phone,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtButton(
                    test: ()
                    {
                      if(formKey.currentState!.validate())
                      {
                        AppCubit.get(context).updateUserData(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                      }
                    },
                    text: 'update',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtButton(
                    test: () {
                      signOut(context);
                    },
                    text: 'Logout',
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
