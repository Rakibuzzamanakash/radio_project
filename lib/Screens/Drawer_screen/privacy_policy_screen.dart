import 'package:flutter/material.dart';

import '../../Widgets/Drawer/custom_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBar(
        title: 'Privacy Policy',
        onAction: (){
          Navigator.pop(context);
        },
      ),
      
      body: ListView(
        children: [
          Text("")
        ],
      ),
    );
  }
}
