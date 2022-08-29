import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/boardingmodel.dart';

import '../../modules/web_view.dart';

Widget defualtButton({
  double width = double.infinity,
  Color color = Colors.blue,
  required Function() test,
  required String text,
}) =>
    Container(
      width: width,
      color: color,
      child: MaterialButton(
        onPressed: test,
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextButton
(
{
  required Function() onPressed,
  required String text

}
)
=>
TextButton
(
onPressed: onPressed, child: Text(text));

Widget myDivider() =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(article, context) =>
    InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list, BuildContext context, {bool isSearch = false}) =>
    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) =>
          ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length,
          ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

Widget defualtInput({
  required TextEditingController controller,
  Function(String)? onSubmitted,
  Function(String)? change,
  required TextInputType inputType,
  void Function()? suffPressed,
  bool issuffix = false,
  bool isPassword = false,
  String? text,
  IconData? iconPre,
  IconData? iconSuff,
  Function()? onTap,
  required FormFieldValidator<String> validate,
}) =>
    TextFormField(
      obscureText: isPassword ? true : false,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: change,
      keyboardType: inputType,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: "$text",
        prefixIcon: Icon(iconPre),
        suffixIcon: issuffix != null
            ? IconButton(onPressed: suffPressed, icon: Icon(iconSuff))
            : null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void naviagteToAndReplace(context, widget) =>
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));

Widget buildBoardingItem(BoardingModel boarding) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${boarding.image}'),
          ),
        ),
        SizedBox(height: 20),
        Text('${boarding.title}',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Jannah',
            )),
        SizedBox(height: 20),
        Text('${boarding.body}',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Jannah',
            )),
      ],
    );
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
// ignore: constant_identifier_names
enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}