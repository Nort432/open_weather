import 'package:flutter/material.dart';

import '../../app_languages/app_languages.dart';
import '../../app_sizes/app_sizes.dart';

class MyTextTranslate extends StatelessWidget {
  const MyTextTranslate(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: AppLanguages.myTranslator(text),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Text(snapshot.data!, style: AppSizes.textBig,);
          } else {
            return Text(text, style: AppSizes.textBig,);
          }
        }
    );
  }
}
