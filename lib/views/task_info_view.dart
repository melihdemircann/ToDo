import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:flutter/material.dart';

// Görev bilgilerini gösteren widget.
class TaskInfoView extends StatelessWidget {
  const TaskInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Row(
        children: [
          // Toplam Görev Sayısı
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900, // Konteyner rengi.
                borderRadius: BorderRadius.circular(10), // Konteynerin köşe yuvarlama değeri.
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          "${viewModel.numTasks}", // Toplam görev sayısı, AppViewModel nesnesinden alınır.
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white, // Metin rengi.
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter + Alignment(0, -2),
                      child: FittedBox(
                        child: Text(
                          "Toplam Görev", // Metin.
                          style: TextStyle(
                            color: Colors.white, // Metin rengi.
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tamamlanan Görev Sayısı
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900, // Konteyner rengi.
                borderRadius: BorderRadius.circular(10), // Konteynerin köşe yuvarlama değeri.
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          "${viewModel.numTasksRemaining}", // Tamamlanan görev sayısı, AppViewModel nesnesinden alınır.
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white, // Metin rengi.
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter + Alignment(0, -2),
                      child: FittedBox(
                        child: Text(
                          "Tamamlananlar", // Metin.
                          style: TextStyle(
                            color: Colors.white, // Metin rengi.
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
