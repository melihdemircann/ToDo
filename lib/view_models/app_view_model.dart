import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Şu anki saat bilgisini Türkiye saat dilimiyle formatlayarak döndüren fonksiyon.
String getTurkishTime() {
  var now = DateTime.now();
  var formatter = DateFormat('HH:mm', 'tr_TR');
  return formatter.format(now);
}

void main() {
  print(getTurkishTime()); // Türkiye saatine göre zaman bilgisini yazdırır
}

// Görev (Task) sınıfı, bir görevin temel özelliklerini içeren veri modelini tanımlar.
class Task {
  String title;   // Görevin başlığı (title).
  String date;    // Görevin tarihi (date).
  String time;    // Görevin saati (time).
  bool complete;  // Görevin tamamlanma durumu (true: tamamlandı, false: tamamlanmadı). Yeni eklenen özellik.

  // Görev oluşturucu (constructor), zorunlu ve varsayılan değerli parametreler alır.
  Task({
    required this.title,    // Görev başlığı zorunludur ve belirtilmelidir.
    required this.date,     // Görev tarihi zorunludur ve belirtilmelidir.
    required this.time,     // Görev saati zorunludur ve belirtilmelidir.
    this.complete = false,  // Görev tamamlanma durumu varsayılan olarak false (tamamlanmamış) olarak ayarlanır.
  });
}

// Uygulamanın durum yönetimini sağlayan sınıf.
class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[]; // Görev listesi.
  User user = User("Kullanıcı Adı"); // Kullanıcı adı bilgisini içeren User nesnesi.
  Color clrLvl1 = Colors.lightBlueAccent.shade400; // Renkler.
  Color clrLvl2 = Colors.white;
  Color clrLvl3 = Colors.grey.shade900;
  Color clrLvl4 = Colors.black;

  int get numTasks => tasks.length; // Görev sayısını döndüren fonksiyon.

  int get numTasksRemaining =>
      tasks.where((task) => !task.complete).length; // Tamamlanmamış görev sayısını döndüren fonksiyon.

  String get username => user.name; // Kullanıcı adını döndüren fonksiyon.

  // Yeni görev eklemek için kullanılan fonksiyon.
  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  // Görev tamamlanma durumunu döndüren fonksiyon.
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  // Görev başlığını döndüren fonksiyon.
  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  // Görev tarihini döndüren fonksiyon.
  String getTaskDate(int taskIndex) {
    return tasks[taskIndex].date;
  }

  // Görev saati döndüren fonksiyon.
  String getTaskTime(int taskIndex) {
    return tasks[taskIndex].time;
  }

  // Görev tamamlanma durumunu ayarlayan fonksiyon.
  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  // Görevi listeden silen fonksiyon.
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  // Kullanıcı adını güncelleyen fonksiyon.
  void updateUsername(String newUsername) {
    user.name = newUsername;
    notifyListeners();
  }

  // Tüm görevleri silen fonksiyon.
  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  // Tamamlanan görevleri silen fonksiyon.
  void deleteCompletedTasks() {
    tasks.removeWhere((task) => task.complete);
    notifyListeners();
  }

  // Alt tabakayı oluşturan (Bottom Sheet) fonksiyon.
  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) {
        return bottomSheetView;
      },
    );
  }
}

// Kullanıcı sınıfı, kullanıcı adı bilgisini içeren bir veri modelini tanımlar.
class User {
  String name; // Kullanıcı adı.

  // Kullanıcı adı bilgisi alarak User nesnesi oluşturan yapıcı fonksiyon.
  User(this.name);
}
