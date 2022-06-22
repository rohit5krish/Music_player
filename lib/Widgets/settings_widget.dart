import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';

class termsNcond extends StatelessWidget {
  termsNcond({Key? key}) : super(key: key);

  final terms = [
    [
      'Terms and Conditions\n=================',
      'Last updated : June 14, 2022\n\nPlease read these terms and conditions carefully before using Our service.'
    ],
    [
      '\nDefinitions\n=========',
      'For the purposes of these Terms and Conditions:\n\n* Application means the software program provided by the Company downloaded by You on any smartphone device, named Gramophone.\n\n* Application Store means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) in which the Application has been downloaded.\n\n* Country refers to: Kerala, India.\n\n* Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Gramophone.\n\n* Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.\n\n* Service refers to the Application.\n\n* Terms and Conditions (also referred as "Terms") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service.\n\n* You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.'
    ],
    [
      '\nAcknowledgment\n==============',
      'These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\n\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.\n\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.'
    ],
    [
      '\nChanges to these Terms and Conditions\n================================',
      'We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.\n\nBy continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.'
    ],
    [
      '\nContext Us\n=========',
      'If you have any questions about these Terms and conditions, you can contact us:\n\n  *By Email: rohitkrishnark5@gmail.com\n\n'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms And Conditions'),
        centerTitle: true,
        backgroundColor: bggradient1,
        elevation: 0,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: terms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(terms[index][0]),
                  subtitle: Text(terms[index][1]),
                );
              })),
    );
  }
}
