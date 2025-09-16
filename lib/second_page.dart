import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add tasks here", 
                    style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData
        (color: Colors.white),
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task:", style: TextStyle
                         (fontSize: 16, fontWeight: FontWeight.w500)),
                    TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        hintText: "Add Task",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 14),
                    Text("Description:", style: TextStyle
                         (fontSize: 16, 
                          fontWeight: FontWeight.w500)),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "Add description",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom
                        (backgroundColor: Colors.black),
                        onPressed: () {
                          if (taskController.text.isNotEmpty &&
                              descriptionController.text.isNotEmpty) {
                            Navigator.pop(context, {
                              "task": taskController.text,
                              "description": descriptionController.text,
                            });
                          }
                        },
                        child: Text("Add Task", 
                                    style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Developed by Ghanashyam Budhathoki",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
