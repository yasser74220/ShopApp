import 'package:shop_app/shared/components/components.dart';

import '../../modules/login.dart';
import '../network/local/cache_helper.dart';

String? token =  CacheHelper.getData(key: 'token');

void printFullText(String? text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text!).forEach((match) => print(match.group(0)));
}


void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      naviagteToAndReplace(
        context,
        ShopLogin(),
      );
    }
  });
}