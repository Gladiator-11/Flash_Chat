// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flash_chat/components/google_sign_in.dart';
// import 'package:flash_chat/screens/registration_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'chat_screen.dart';

// class GoogleLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider(
//         create: (BuildContext context) {
//           googlesignin();
//         },
//         child: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasData) {
//                 return ChatScreen(name: 'name', email: 'email');
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text('Something is wrong'),
//                 );
//               } else {
//                 return RegistrationScreen();
//               }
//             }),
//       ),
//     );
//   }
// }
