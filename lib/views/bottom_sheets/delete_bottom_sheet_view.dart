import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

// Görevleri silme için alt tabaka (Bottom Sheet) görünümünü oluşturan sınıf.
class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        height: 125, // Görünüm yüksekliği.
        color: Colors.black54, // Arkaplan rengi.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                viewModel.deleteAllTasks(); // Tüm görevleri silen fonksiyon çağrılır.
                Navigator.of(context).pop(); // Alt tabaka kapatılır.
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Buton metin rengi.
                backgroundColor: viewModel.clrLvl3, // Buton arka plan rengi, AppViewModel nesnesinden alınır.
                textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20), // Buton metin stil bilgileri.
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Buton şekli.
              ),
              child: Text("Hepsini Sil"), // Buton metni.
            ),

            SizedBox(width: 15,), // Butonlar arasında boşluk bırakmak için SizedBox widget'ı kullanılır.

            ElevatedButton(
              onPressed: () {
                viewModel.deleteCompletedTasks(); // Tamamlanan görevleri silen fonksiyon çağrılır.
                Navigator.of(context).pop(); // Alt tabaka kapatılır.
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Buton metin rengi.
                backgroundColor: viewModel.clrLvl3, // Buton arka plan rengi, AppViewModel nesnesinden alınır.
                textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20), // Buton metin stil bilgileri.
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Buton şekli.
              ),
              child: Text("Tamamlananları Sil"), // Buton metni.
            ),
          ],
        ),
      );
    });
  }
}
