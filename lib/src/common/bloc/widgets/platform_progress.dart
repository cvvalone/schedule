import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformProgress extends StatelessWidget {
  const PlatformProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}