import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:todo/views/bottom_sheets/add_task_bottom_sheet_view.dart';
import 'package:flutter/material.dart';

// Görev ekleme butonunu oluşturan sınıf.
class AddTaskView extends StatelessWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: viewModel.clrLvl3, // Buton arka plan rengi, AppViewModel nesnesinden alınır.
              foregroundColor: Colors.red, // Buton metin rengi.
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Buton şekli.
            ),
            onPressed: () {
              HapticFeedback.heavyImpact(); // Butona dokunulduğunda haptic feedback (titreşim) etkisi oluşturur.
              viewModel.bottomSheetBuilder(const AddTaskBottomSheetView(), context); // Görev ekleme alt tabakasını (AddTaskBottomSheetView) çağırarak gösterir.
            },
            child: Icon(Icons.add, size: 30,), // Buton içindeki ekleme simgesi.
          ),
        );
      },
    );
  }
}
