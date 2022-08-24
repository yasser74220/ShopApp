
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../modules/web_view.dart';

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget buildArticleItem(article , context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

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

              children:

              [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style:  Theme.of(context).textTheme.bodyText1,

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
Widget articleBuilder(list, BuildContext context , {bool isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index] , context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,),
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
  Function ()? onTap,

  required FormFieldValidator<String>  validate,
}) =>
    TextFormField(

      obscureText: isPassword? true : false,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: change,
      keyboardType: inputType,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(

        labelText: "$text",
        prefixIcon: Icon(iconPre),
        suffixIcon: issuffix != null ? IconButton(onPressed: suffPressed, icon: Icon(iconSuff)): null,
        border: OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);