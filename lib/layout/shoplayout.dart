import 'package:flutter/material.dart';
import 'package:shop_app/modules/login.dart';
import 'package:shop_app/shared/components/components.dart';

import '../shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Salla',
        ),
      ),
      body: TextButton(
        onPressed: ()
        {
          CacheHelper.removeData(key: 'token',).then((value) {
            if(value)
            {
              naviagteToAndReplace(context, ShopLogin(),);
            }
          });
        },
        child: Text(
          'SIGN OUT',
        ),
      ),
    );
  }
}
