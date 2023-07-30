import 'package:flutter/material.dart';
import 'package:todo/views/task_page.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

// Ana ekranı oluşturan sınıf.
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plana gif ekleyen Image widget'ı.
          Positioned.fill(
            child: Image.asset(
              'assets/giphy.gif',
              fit: BoxFit.cover,
            ),
          ),
          // Üst kısımda "Hoşgeldiniz" yazısı görüntüleyen Text widget'ı.
          Positioned(
            top: 80,
            left: 70,
            right: 70,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Hoşgeldiniz",
                style: TextStyle(
                  fontSize: 40, // Yazı boyutu düzeltilmiş 40 olarak değiştirildi.
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          // "Görevler Sayfasına Git" butonu ve merkezdeki sütun.
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 8),
                // "Görevler Sayfasına Git" butonu ve onun özellikleri.
                TextButton(
                  onPressed: () {
                    // Butona tıklandığında TaskPage'e geçiş yapacak kod.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskPage(title: 'Task Sayfası'),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(Size(300, 80)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Görevler Sayfasına Git',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Uygulamanın başlatıldığı ana fonksiyon.
void main() {
  runApp(MyApp());
}

// Uygulamanın ana sınıfı.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(), // Ana ekranı gösteren MainPage sınıfı.
      ),
    );
  }
}
