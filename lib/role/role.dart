import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_match_new/login_signup_auth/screens/signup2/student_signup.dart';
import 'customebutton.dart';
import 'customimageview.dart';

class Usertype_Selection extends StatefulWidget {
  const Usertype_Selection({super.key});

  @override
  State<Usertype_Selection> createState() => _Usertype_SelectionState();
}

class _Usertype_SelectionState extends State<Usertype_Selection> {
  bool tutorselected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Container(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center
                , children: [
              // CustomImageView(
              //     svgPath: ImageConstant.imgArrowleft,
              //     height: 24,
              //     width: 24,
              //     alignment: Alignment.centerLeft,
              //     onTap: () {
              //       onTapImgArrowleft();
              //     }),
              Padding(
                  padding: const EdgeInsets.only(top: 47),
                  child: Text("Select user type",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left, style: TextStyle(color: Colors.white),)),
              Container(
                  width: 209,
                  margin: const EdgeInsets.only(top: 7),
                  child: Text("Are you looking for tutor or student?",
                      maxLines: null,
                      textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
              Padding(
                  padding:
                  const EdgeInsets.only(top: 38, bottom: 5, left: 8, right: 8),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center
                      , children: [
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              tutorselected = false;
                            });
                            // Get.toNamed("/userlogin");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentSignup()));
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 7),
                              padding: const EdgeInsets.only(
                                  left: 18, top: 24, right: 18, bottom: 24),
                              decoration:
                              // tutorselected == false?
                              BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(24),
                                border: tutorselected == false
                                    ? Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                )
                                    : Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              // : BoxDecoration(
                              //     color: ColorConstant.whiteA700,
                              //     borderRadius: BorderRadius.circular(24),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: ColorConstant.gray70014,
                              //         spreadRadius: 2,
                              //         blurRadius: 2,
                              //         offset: const Offset(
                              //           0,
                              //           0,
                              //         ),
                              //       ),
                              //     ],
                              //   ),

                              // ? AppDecoration.outlineGray900.copyWith(
                              //     borderRadius: BorderRadiusStyle.roundedBorder24)
                              // : AppDecoration.outlineGray70014.copyWith(
                              //     borderRadius: BorderRadiusStyle.roundedBorder24),

                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: 64,
                                        width: 64,
                                        variant: IconButtonVariant.FillOrange50065,
                                        shape: IconButtonShape.CircleBorder32,
                                        padding: IconButtonPadding.PaddingAll16,
                                        child: CustomImageView(
                                            svgPath: 'assets/svgs/student_icon.svg')),
                                    // CustomIconButton(
                                    //     height: 64,
                                    //     width: 64,
                                    //     variant: IconButtonVariant.FillGray90065,
                                    //     shape: IconButtonShape.CircleBorder32,
                                    //     padding: IconButtonPadding.PaddingAll16,
                                    //     child: CustomImageView(
                                    //         svgPath: "assets/svgs/img_icon.svg")),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 29),
                                        child: Text("Student",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,)),
                                    Container(
                                        width: (120),
                                        margin:
                                        const EdgeInsets.only(top: 9, bottom: 1),
                                        child: Text("To find tutor",
                                            maxLines: null,
                                            textAlign: TextAlign.center,))
                                  ])),
                        )),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              tutorselected = true;
                            });
                            Get.toNamed("/shoplogin");
                          },
                          child: Container(
                              margin: const EdgeInsets.only(left: 7),
                              padding: const EdgeInsets.only(
                                  left: 14, top: 24, right: 14, bottom: 24),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(24),
                                border: tutorselected == false
                                    ? Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )
                                    : Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              ),
                              // decoration: tutorselected == true
                              //     ? AppDecoration.outlineGray900.copyWith(
                              //         borderRadius: BorderRadiusStyle.roundedBorder24)
                              //     : AppDecoration.outlineGray70014.copyWith(
                              //         borderRadius: BorderRadiusStyle.roundedBorder24),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                        height: 64,
                                        width: 64,
                                        variant: IconButtonVariant.FillGray90065,
                                        shape: IconButtonShape.CircleBorder32,
                                        padding: IconButtonPadding.PaddingAll16,
                                        child: CustomImageView(
                                            svgPath: "assets/svgs/teacher_icon.svg")),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 29),
                                        child: Text("Tutor",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,)),
                                    Container(
                                        width: (109),
                                        margin:
                                        const EdgeInsets.only(top: 9, bottom: 1),
                                        child: Text("To teach students",
                                            maxLines: null,
                                            textAlign: TextAlign.center,))
                                  ])),
                        ))
                  ]))
            ])),
      ),
    );
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapContinue() {
// TODO: implement Actions
  }
}