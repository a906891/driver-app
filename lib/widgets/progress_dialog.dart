import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {

  String? message;
  ProgressDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black12,
      child: Container(

        margin: const EdgeInsets.all(16),
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),

        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(width: 6,),

              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),

              const SizedBox(width: 26.0,),

              Text(
                message!,style: const TextStyle(
                color: Colors.black,
                fontSize: 12
              ),
              )

            ],
            
          ),
        ),
      ),
    );
  }
}
