import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SystemRequirementsButton extends StatelessWidget {
  final String requirementUrl;

  SystemRequirementsButton({required this.requirementUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: () {
          launch(requirementUrl);
        },
        child: const Text('View System Requirements'),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
