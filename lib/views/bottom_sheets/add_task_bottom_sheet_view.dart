import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

// Yeni görev ekleme için alt tabaka (Bottom Sheet) görünümünü oluşturan sınıf.
class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController editingController = TextEditingController(); // TextField içeriğini kontrol eden TextEditingController nesnesi oluşturulur.
    return Consumer<AppViewModel>(builder: (context, viewModel, child) { // AppViewModel nesnesine bağlı olarak alt tabaka widget'ı oluşturulur.
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Alt tabaka görünümünün ekranın altındaki boşluğu kaplamasını sağlar.
        child: Container(
          height: 80, // Görünümün yüksekliği.
          child: Center(
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                onSubmitted: (value) { // TextField'ta metin girildiğinde veya düzenleme tamamlandığında çağrılır.
                  if (editingController.text.isNotEmpty) { // Text girişi boş değilse yeni görev oluşturulur ve görev listesine eklenir.
                    DateTime now = DateTime.now();
                    String date = '${now.year}-${now.month}-${now.day}';
                    String time = '${now.hour}:${now.minute}';

                    Task newTask = Task(
                      title: editingController.text, // Text girişi görev başlığı olarak atanır.
                      complete: false, // Yeni görev başlangıçta tamamlanmamış olarak ayarlanır.
                      date: date, // Şu anki tarih görevin tarihi olarak atanır.
                      time: time, // Şu anki saat görevin saati olarak atanır.
                    );

                    viewModel.addTask(newTask); // Yeni görevi görev listesine ekleyen fonksiyon çağrılır.
                    editingController.clear(); // TextField içeriğini temizler.
                  }

                  Navigator.of(context).pop(); // Alt tabaka kapatılır.
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  filled: true,
                  fillColor: viewModel.clrLvl2, // TextField arka plan rengi, AppViewModel nesnesinden alınır.
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: viewModel.clrLvl4, // Cursor (imleç) rengi, AppViewModel nesnesinden alınır.
                autofocus: true, // TextField'e otomatik odaklanır.
                autocorrect: false, // Otomatik düzeltmeyi devre dışı bırakır.
                controller: editingController, // TextField içeriğini yöneten TextEditingController nesnesi atanır.
                style: TextStyle(
                  color: viewModel.clrLvl4, // Text rengi, AppViewModel nesnesinden alınır.
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
