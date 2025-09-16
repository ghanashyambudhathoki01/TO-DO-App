import 'package:flutter/material.dart';
import 'second_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> arrNames = [
    {
      "task": "Finish Flutter Project",
      "description": "Complete the main module of the Flutter app by today.",
      "status": "pending",
    },
    {
      "task": "Read Design Patterns Book",
      "description": "Read 20 pages of the Design Patterns book.",
      "status": "pending",
    },
    {
      "task": "Grocery Shopping",
      "description": "Buy vegetables, fruits, and milk for the week.",
      "status": "completed",
    },
    {
      "task": "Prepare Presentation",
      "description": "Create slides for tomorrow’s client meeting.",
      "status": "pending",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Todo App", style: TextStyle(color: Colors.white)),
            InkWell(
              child: Icon(Icons.add, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddTask()),
                ).then((newTask) {
                  if (newTask != null) {
                    setState(() {
                      newTask["status"] = "pending";
                      arrNames.add(newTask);
                    });
                  }
                });
              },
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final task = arrNames[index];
                  return ListTile(
                    leading: Text("${index + 1}. "),
                    title: Text(
                      task["task"] ?? "",
                      style: TextStyle(
                        color: task["status"] == "completed"
                            ? Colors.green
                            : Colors.black,
                        fontWeight: FontWeight.w700,
                        decoration: task["status"] == "completed"
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task["description"] ?? "",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Status: ${task["status"]}",
                          style: TextStyle(
                            fontSize: 12,
                            color: task["status"] == "completed"
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          if (value == "completed") {
                            task["status"] = "completed";
                          } else if (value == "pending") {
                            task["status"] = "pending";
                          } else if (value == "delete") {
                            arrNames.removeAt(index);
                          }
                        });
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "completed",
                          child: Row(
                            children: [
                              Icon(Icons.check, color: Colors.green),
                              SizedBox(width: 8),
                              Text("Mark as Completed"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "pending",
                          child: Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.orange),
                              SizedBox(width: 8),
                              Text("Mark as Pending"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "delete",
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 8),
                              Text("Delete"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: arrNames.length,
                separatorBuilder: (context, index) {
                  return Divider(height: 10, thickness: 1);
                },
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
