import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

// Kullanıcı adını güncellemek için alt tabaka (Bottom Sheet) görünümünü oluşturan sınıf.
class UserBottomSheetView extends StatelessWidget {
  const UserBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController editingController = TextEditingController(); // TextField içeriğini kontrol eden TextEditingController nesnesi oluşturulur.
    return Consumer<AppViewModel>(builder: (context, viewModel, child) { // AppViewModel nesnesine bağlı olarak alt tabaka widget'ı oluşturulur.
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Alt tabaka görünümünün ekranın altındaki boşluğu kaplamasını sağlar.
        child: Container(
          height: 80, // Görünüm yüksekliği.
          child: Center(
            child: SizedBox(
              height: 40,
              width: 250,
              child: TextField(
                onSubmitted: (value) {
                  if (editingController.text.isNotEmpty) { // Text girişi boş değilse, yeni kullanıcı adı AppViewModel nesnesindeki updateUsername() fonksiyonuyla güncellenir.
                    viewModel.updateUsername(editingController.text);
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
                  color: Colors.black, // Text rengi.
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
