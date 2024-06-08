import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:home_plate/Constants/constants.dart';

class LoadingDialog extends StatefulWidget {
  final String message;
  final Color color;

  const LoadingDialog({
    Key? key,
    this.message = 'Loading...',
    this.color = Constants.secondaryColor,
  }) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitFadingCircle(
              color: widget.color,
              size: 50.0,
            ),
            const SizedBox(height: 15.0),
            Text(
              widget.message,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}