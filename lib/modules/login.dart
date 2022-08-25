import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';

class ShopLogin extends StatelessWidget {
   var EmailController = TextEditingController();
   var PasswordController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'login now to browse our hot offers',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.grey),
            ),
            defualtInput(
              controller: EmailController,
              inputType: TextInputType.emailAddress,
              validate: (value) {
                
              },
              onTap: () {
                
              },
              iconPre:  Icons.email,

            ),
            defualtInput(
              controller: PasswordController,
              inputType: TextInputType.visiblePassword,
              validate: (value) {

              },
              onTap: () {

              },
              iconPre:  Icons.password,
              isPassword: true,
              issuffix: true,
              iconSuff: Icons.remove_red_eye,

            ),
          ],
        ),
      ),
    );
  }
}
