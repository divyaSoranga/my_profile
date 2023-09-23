import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/src/modules/homescreen/homescreen_ctrl.dart';

import '../loginscreen/google_service.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 InitService.signOut(context: context);
//               },
//               icon: Icon(Icons.logout))
//         ],
//       ),
//       body: Column(
//         children: [
//
//           const Text(
//             'Name : Divya Soranga',
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             'email : dsoranga@gmail.com',
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             'skills : Flutter dart Api calling Firebase ',
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             'work experience :1 year ',
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           // Stack(
//           //   children: [
//           //     CircleAvatar(
//           //       radius: 50,
//           //       backgroundColor: Colors.black38,
//           //       child: CircleAvatar(
//           //         radius: 40,
//           //         backgroundImage: FileImage(File(c.pickedPath())),
//           //       ),
//           //     ),
//           //     Positioned(
//           //       right: 0,
//           //       bottom: 0,
//           //       child: IconButton(
//           //         onPressed: () {},
//           //         icon: Icon(Icons.camera_alt),
//           //       ),
//           //     )
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }
class HomeScreen extends StatelessWidget {
  final UserProfile user = UserProfile(
    name: 'Divya Soranga',
    email: 'dsoranga@gmail.com',
    skills: ['Flutter', 'Dart', 'UI Design'],
    workExperience: [
      'Software Engineer at ABC Inc',
      'UI/UX Designer at XYZ Corp'
    ],
  );
  final c = Get.put(HomeScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implement logout functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 140,
                width: 120,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                        top: 0,
                        child: Obx(() {
                          return CircleAvatar(
                              backgroundColor: Color(0xFF7389B8),
                              radius: 60,
                              backgroundImage: FileImage(File(c.pickedPath())));
                        })),
                    InkWell(
                      onTap: () {
                        c.imagePicker();
                        // !c.editing.value ? c.pickedImage() : null;
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${user.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Skills:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: user.skills.map((skill) => Text(skill)).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Work Experience:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: user.workExperience
                  .map((experience) => Text(experience))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final List<String> skills;
  final List<String> workExperience;

  UserProfile({
    required this.name,
    required this.email,
    required this.skills,
    required this.workExperience,
  });
}
