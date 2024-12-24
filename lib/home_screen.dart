import 'package:firebase_student_info_realtime_db/view_students_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'add_student_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Info App',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF7B3F00).withOpacity(0.8), // Chocolate color for AppBar
      ),
      body: Container(
        // Set the background gradient (Chocolate gradient)
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7B3F00).withOpacity(0.5), // #7B3F00 Dark Chocolate
              Color(0xFFC08552), // #A95700 Milk Chocolate
              Color(0xFF622A00).withOpacity(0.8), // #622A00 Darker Chocolate
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientButton(
                text: 'Add Student',
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Navigating to Add Student",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Color(0xFFC08552),
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStudentScreen()),
                  );
                },
              ),
              SizedBox(height: 20), // Space between buttons
              GradientButton(
                text: 'View All Students',
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Navigating to View All Students",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Color(0xFFC08552),
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewStudentsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7B3F00),
              Color(0xFFC08552), // Dark Chocolate
              Color(0xFFA95700), // Milk Chocolate
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30), // Rounded corners
          border: Border.all(
            width: 2, // Border width
            style: BorderStyle.solid, // Solid border
            color: Colors.black.withOpacity(0.7), // Border color with opacity
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
