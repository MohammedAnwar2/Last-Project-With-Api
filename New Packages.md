1- flutter_iconly => for a good icons

2- عند استعمال ال Theme  على مستوى البرنامج وعند تحديد لل Icons لون معين فان هذا اللون بالطبيعي راح يظهر عند استخدام ال icon لكن عند استخدام اال BUTTON ما رح يظهر هذا اللون الا اذا استخدمنا ال GestureDetector 

3- عند استعمال ال suffix  لا تظهر الا عند النقر على الsearch >>> الحل نستخدم الsuffixIcon  من اجل ان يبقى كل شيء ظاهر تبع ال suffix  حتى قبل الضغط على ال search  

4- لما نغط على ال  بعدها راح تظهر لوحة المفاتيح وما رح تنغلق لوحة المفاتيح الا اذا ضغطنا على زر موافق >> ال نستخدم الكود التالي
```dart
return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        //مهمه جدا لغلق لوحة المفاتيح
      },
      child: Scaffold(
      body:TextField()
      ));
```
