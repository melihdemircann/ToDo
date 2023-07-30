import 'package:flutter/material.dart';
import 'package:todo/views/add_task_view.dart';
import 'package:todo/views/header_view.dart';
import 'package:todo/views/task_info_view.dart';
import 'package:todo/views/task_list_view.dart';

// Görev sayfasını oluşturan widget.
class TaskPage extends StatelessWidget {
  final String title; // "title" adında bir parametre ekledik

  const TaskPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300, // Sayfa arka plan rengi.
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // HeaderView widget'ı sayfanın üst kısmında gösterilecek.
            Expanded(flex: 1, child: HeaderView()),

            // TaskInfoView widget'ı, toplam görev sayısı ve tamamlanan görev sayısını göstermek için kullanılacak.
            Expanded(flex: 1, child: TaskInfoView()),

            // TaskListView widget'ı, görevlerin listelendiği ana liste görünümü olacak.
            Expanded(flex: 7, child: TaskListView()),
          ],
        ),
      ),
      floatingActionButton: AddTaskView(), // Görev ekleme butonu için AddTaskView widget'ı kullanılacak.
    );
  }
}
