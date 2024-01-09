// import 'package:flutter/material.dart';
// import 'package:front/data/model/user_registration.dart';
// import 'package:front/data/provider/user_provider_custom.dart';
// import 'package:front/screen/register_sub_screens.dart/register_category_select_screen.dart';
// import 'package:front/screen/register_sub_screens.dart/register_content_select_screen.dart';
// import 'package:front/screen/start_screen.dart';
// import 'package:front/widget/custom_modal_progress_hud.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:provider/provider.dart';

// class RegisterScreen extends StatefulWidget {
//   static const String id = 'register_screen';

//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final UserRegistration _userRegistration = UserRegistration();

//   final int _endScreenIndex = 3;
//   int _currentScreenIndex = 0;
//   bool _isLoading = false;
//   late UserProvider _userProvider;

//   @override
//   void initState() {
//     super.initState();
//     _userProvider = Provider.of<UserProvider>(context, listen: false);
//   }

//   void registerUser() async {
//     setState(() {
//       _isLoading = true;
//     });

//     await _userProvider.signInWithGoogle().then((response) {
//       if (response) {
//         Navigator.pop(context);
//         Navigator.pushNamed(context, TopNavigationScreen.id);
//       }
//     });

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void goBackPressed() {
//     if (_currentScreenIndex == 0) {
//       Navigator.pop(context);
//       Navigator.pushNamed(context, StartScreen.id);
//     } else {
//       setState(() {
//         _currentScreenIndex--;
//       });
//     }
//   }

//   Widget getSubScreen() {
//     switch (_currentScreenIndex) {
//       case 0:
//         return CategorySelectScreen(
//             onChanged: (value) => {_userRegistration.category = value});
//       case 1:
//         return ContentSelectScreen(
//             onChanged: (value) => {_userRegistration.content = value});
//       default:
//         return Container();
//     }
//   }

//   bool canContinueToNextSubScreen() {
//     switch (_currentScreenIndex) {
//       case 0:
//         return (_userRegistration.category.length >= 1);
//       case 1:
//         return (_userRegistration.content.length >= 1);
//       default:
//         return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: 
//     Scaffold(body: CustomModalProgressHUD(
//           inAsyncCall: _isLoading,
//           child: Container(
//             margin: EdgeInsets.only(bottom: 40),
//             child: Column(
//               children: [
//                 Container(
//                   child: LinearPercentIndicator(
//                       lineHeight: 5,
//                       percent: (_currentScreenIndex / _endScreenIndex),
//                       progressColor: kAccentColor,
//                       padding: EdgeInsets.zero),
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                       padding: kDefaultPadding.copyWith(
//                           left: kDefaultPadding.left / 2.0,
//                           right: 0.0,
//                           bottom: 4.0,
//                           top: 4.0),
//                       child: IconButton(
//                         padding: EdgeInsets.all(0.0),
//                         icon: Icon(
//                           _currentScreenIndex == 0
//                               ? Icons.clear
//                               : Icons.arrow_back,
//                           color: kSecondaryColor,
//                           size: 42.0,
//                         ),
//                         onPressed: () {
//                           goBackPressed();
//                         },
//                       )),
//                 ),
//                 SizedBox(height: 20),
//                 Expanded(
//                   child: Container(
//                       width: double.infinity,
//                       child: getSubScreen(),
//                       padding: kDefaultPadding.copyWith(top: 0, bottom: 0)),
//                 ),
//                 Container(
//                   padding: kDefaultPadding,
//                   child: _currentScreenIndex == (_endScreenIndex)
//                       ? RoundedButton(
//                           text: 'REGISTER',
//                           onPressed: _isLoading == false
//                               ? () => {registerUser()}
//                               : null)
//                       : RoundedButton(
//                           text: 'CONTINUE',
//                           onPressed: () => {
//                             if (canContinueToNextSubScreen())
//                               setState(() {
//                                 _currentScreenIndex++;
//                               })
//                             else
//                               showSnackBar(
//                                   _scaffoldKey, getInvalidRegistrationMessage())
//                           },
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),,))
//   },

// }
