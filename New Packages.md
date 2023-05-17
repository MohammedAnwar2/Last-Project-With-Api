1- flutter_iconly => for a good icons
https://pub.dev/packages/flutter_iconly

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

5- من اجل جعل الخط يتمدد
```dart
Flexible(
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: SizedBox(
    width: Get.width,
    child: FittedBox(
      fit: BoxFit.fill,
      child: Text(
        "50 %\nOFF",
        style: GoogleFonts.asap(color: Theme
            .of(context)
            .cardColor,  fontWeight: FontWeight.bold),
        maxLines: 2,
      ),
    ),
  ),
),
)
```

6- card_swiper: ^2.0.4 >> التقلب بين الصفحات
