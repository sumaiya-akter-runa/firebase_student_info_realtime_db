import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'add_student_screen.dart';

class ViewStudentsScreen extends StatefulWidget {
  @override
  _ViewStudentsScreenState createState() => _ViewStudentsScreenState();
}

class _ViewStudentsScreenState extends State<ViewStudentsScreen> {
  final DatabaseReference database = FirebaseDatabase.instance.ref().child('students');

  List<Map<String, String>> students = [];
  List<String> studentKeys = [];

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  void _fetchStudents() {
    database.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null) {
        students.clear();
        studentKeys.clear();
        data.forEach((key, value) {
          students.add({
            'name': value['name'] ?? '',
            'phone': value['phone'] ?? '',
            'email': value['email'] ?? '',
            'location': value['location'] ?? '',
          });
          studentKeys.add(key);
        });
      }
      setState(() {});
    });
  }

  void _deleteStudent(String studentKey) async {
    try {
      await database.child(studentKey).remove();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Students',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFC08552),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFC08552).withOpacity(0.5),
              Color(0xFF5D2A42),
            ],
          ),
        ),
        child: students.isEmpty
            ? Center(
          child: Text(
            'No students found!',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        )
            : ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            final studentKey = studentKeys[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.person, size: 40, color: Colors.brown),
                title: Text(
                  student['name'] ?? 'N/A',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${student['phone']}'),
                    Text('Email: ${student['email']}'),
                    Text('Location: ${student['location']}'),
                  ],
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddStudentScreen(
                            studentId: studentKey,
                            studentData: student,
                          ),
                        ),
                      );
                    } else if (value == 'delete') {
                      _deleteStudent(studentKey);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5D2A42),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
