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

6- card_swiper: ^2.0.4 >>  التقلب بين الصفحات بطريقة حلو , ادخل للبرنامج وراح تشوف الطريقه


7 - اذا عندنا List وبداخلها  map  نستخدم الطريقة الاتية من اجل عمل Get  من ال Api
```dart

class UserController extends GetxController {
  var isDataLoading = false.obs;

  Future<void> fetchUser(String type) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var resposneData = jsonDecode(response.body);
      print(resposneData);
      CountsOfControllers.user =
          resposneData.map<UserModel>((json) => UserModel.fromJson(json))
              .toList();
      isDataLoading.value = true;
    }
    else {
      Get.snackbar("Error", "???");
    }

  }
  @override
  void onInit() {
    fetchUser("categories");
    super.onInit();
  }
}
```


8- الصوره تظهر كأنها متحركه عند محاولة جلب البيانات من ال Api نستخد ال fancy_shimmer_image: ^2.0.2

```dart
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: category.image.toString(),
                height: Get.height*.45,
                width: Get.width*.45,
                errorWidget: const Icon(IconlyBold.danger,color: Colors.red,size: 28,),//flutter_iconly بكج الايكونات
              ))
```


9 - فينا نستخدم ال Align  لجعل الشيء بالنص و مثال على استخدامه بداخل ال  Stack بدون عمل Positined ووجع رأس
```dart
Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: category.image.toString(),
                height: Get.height*.45,
                width: Get.width*.45,
                errorWidget: const Icon(IconlyBold.danger,color: Colors.red,size: 28,),
              )),
          Align(
              alignment: Alignment.center,
              child: Text(category.name.toString(),
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      backgroundColor: lightCardColor.withOpacity(.5))))
        ],
      )
```

10 - باستخدام ال page_transition: ^2.0.9 نقدر ننتقلب بين الصفحلت مع انيماشن حلو , ادخل البرنامج وشف الطريقة...كبعا يستخدم مع الNavigator ولا يستخدم مع Get.to() مثلا 
```dart
PageRouteBuilder TransitionPage({required Widget screen,required Alignment alignment})
{
  return PageRouteBuilder( transitionDuration: Duration(milliseconds: 300),transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return ScaleTransition(scale: animation,alignment: alignment, child: child);
  }, pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return  screen;
  },);
}
```

11- لا يظهر ال splash عند استخدام ال Container مع لون لذا فيك تستخم حاجه افضل لكن برضو بدون لووون لو تبي ال splash يظهر طبعا مع Inkwel فيك تستخدم Material تشبه لل Container  لكن بدون لوون . برضو فيك تستخدم ال Contaner  لكن لا تحدد لها لوووون 
