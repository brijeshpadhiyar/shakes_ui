import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:shakes_ui/core/font.dart';
import 'package:shakes_ui/widgets/shake_widget.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final List<String> _shakes = [
    "assets/shake.png",
    "assets/shake1.png",
    "assets/shake2.png",
    "assets/shake3.png",
    "assets/shake4.webp",
  ];

  bool _shakeSelected = true;
  bool _coffeeSelected = false;
  bool _cocktailsSelected = false;
  bool _softSelected = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 7.h, left: 2.w, right: 2.w),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 153, 33, 53).withOpacity(1), const Color(0xFF521f26)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Positioned(
                top: 1.h,
                left: 1.w,
                child: Transform.translate(
                  offset: Offset(animation.value, animation.value),
                  child: BlurryContainer(
                      height: 15.h,
                      width: 15.w,
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red.withOpacity(.2),
                      blur: 2,
                      child: Container()),
                ),
              ),
              Bounce(
                  child: Positioned(
                bottom: 6.h,
                left: 15.w,
                child: Transform.translate(
                  offset: Offset(animation.value * -1, animation.value * -1),
                  child: BlurryContainer(
                    height: 15.h,
                    width: 15.h,
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red.withOpacity(.2),
                    blur: 2,
                    child: Container(),
                  ),
                ),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome, Sanju",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 4.h,
                    width: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SHAKES",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontSize: 25.sp,
                        letterSpacing: 5,
                        fontFamily: AppFont.electrolize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Search",
                          contentPadding: EdgeInsets.only(left: 2.w),
                          icon: Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: const Icon(
                              Icons.search,
                              color: Colors.brown,
                              size: 30,
                            ),
                          )),
                    ),
                  ),
                  // side bar and item
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 65.h,
                                width: 90.w,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Positioned(
                                          right: 21.w,
                                          child: Transform.rotate(
                                            angle: pi * 1.5,
                                            child: Row(
                                              children: [
                                                // * soft juice
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = true;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected = false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: const Duration(milliseconds: 1000),
                                                    child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 500),
                                                      height: 9.h,
                                                      width: 25.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: _softSelected
                                                            ? Colors.red.withOpacity(.5)
                                                            : Colors.white.withOpacity(.1),
                                                      ),
                                                      padding: const EdgeInsets.all(5),
                                                      child: Center(
                                                        child: Text(
                                                          "Soft",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              overflow: TextOverflow.visible,
                                                              fontSize: 15.sp,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = true;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected = false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: const Duration(milliseconds: 800),
                                                    child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 500),
                                                      height: 9.h,
                                                      width: 25.w,
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: _coffeeSelected
                                                            ? Colors.red.withOpacity(.5)
                                                            : Colors.white.withOpacity(.1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Coffees",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              overflow: TextOverflow.visible,
                                                              fontSize: 15.sp,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = false;
                                                      _cocktailsSelected = true;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: const Duration(milliseconds: 600),
                                                    child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 500),
                                                      height: 9.h,
                                                      width: 25.w,
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: _cocktailsSelected
                                                            ? Colors.red.withOpacity(.5)
                                                            : Colors.white.withOpacity(.1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Cocktails",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              overflow: TextOverflow.visible,
                                                              fontSize: 15.sp,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _softSelected = false;
                                                      _coffeeSelected = false;
                                                      _shakeSelected = true;
                                                      _cocktailsSelected = false;
                                                    });
                                                  },
                                                  child: Bounce(
                                                    delay: const Duration(milliseconds: 400),
                                                    child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 500),
                                                      height: 9.h,
                                                      width: 25.w,
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: _shakeSelected
                                                            ? Colors.red.withOpacity(.5)
                                                            : Colors.white.withOpacity(.1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Shake",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              overflow: TextOverflow.visible,
                                                              fontSize: 15.sp,
                                                              fontWeight: FontWeight.w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
        
                                      //divider
        
                                      Positioned(
                                          left: 30.w,
                                          top: 7.9.h,
                                          child: Container(
                                            height: 50.h,
                                            width: 1,
                                            color: Colors.white,
                                          )),
        
                                      // shakes list
        
                                      Positioned(
                                          right: 0,
                                          top: 1.h,
                                          child: SizedBox(
                                            height: 65.h,
                                            width: 50.w,
                                            child: ListWheelScrollView(itemExtent: 250, children: [
                                              GestureDetector(
                                                onTap: () {
                                                  print("Hel");
                                                },
                                                child: ShakeWidget(
                                                  shakes: "Mix shake",
                                                  shakesImg: _shakes[0],
                                                  price: "543",
                                                ),
                                              ),
                                              ShakeWidget(
                                                shakes: "Soft shake",
                                                shakesImg: _shakes[1],
                                                price: "342",
                                              ),
                                              ShakeWidget(
                                                shakes: "Mech Shake",
                                                shakesImg: _shakes[2],
                                                price: "234",
                                              ),
                                              ShakeWidget(
                                                shakes: "Berry Juice",
                                                shakesImg: _shakes[3],
                                                price: "542",
                                              ),
                                              ShakeWidget(
                                                shakes: "Milk Juice",
                                                shakesImg: _shakes[4],
                                                price: "542",
                                              ),
                                            ]),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
