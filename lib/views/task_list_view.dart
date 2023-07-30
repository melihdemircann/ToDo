import 'package:flutter/material.dart';
import 'package:todo/views/task_page.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';

// Görev listesini gösteren widget.
class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Marsiass.jpg'), // Arkaplan resmi.
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
          separatorBuilder: (context, index) {
            return SizedBox(height: 15); // Görevler arasında boşluk ekleyen widget.
          },
          itemCount: viewModel.tasks.length, // Görev sayısı, AppViewModel nesnesinden alınır.
          itemBuilder: (context, index) {
            final task = viewModel.tasks[index]; // Mevcut görev nesnesi.
            final taskNumber = index + 1; // Görev numarası (1'den başlayarak).
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                viewModel.deleteTask(index); // Görevi silmek için AppViewModel'deki deleteTask() fonksiyonunu çağırır.
              },
              background: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.delete_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // Görev detaylarını gösteren bir diyalog penceresi açar.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.grey,
                        title: Text('Görev Ayrıntıları'),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 24,
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text('Görev adı: ${viewModel.getTaskTitle(index)}'), // Görev başlığı, AppViewModel nesnesinden alınır.
                              Text(
                                'Görev tarihi: ${viewModel.getTaskDate(index)}', // Görev tarihi, AppViewModel nesnesinden alınır.
                              ),
                              Text(
                                'Görev saati: ${viewModel.getTaskTime(index)}', // Görev saati, AppViewModel nesnesinden alınır.
                              ),
                              // Diğer görev ayrıntıları
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Diyalog penceresini kapatır.
                            },
                            child: Text('Kapat'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(
                        width: 2,
                        color: Colors.red.shade900,
                      ),
                      checkColor: viewModel.clrLvl1, // Onay işareti rengi, AppViewModel nesnesinden alınır.
                      activeColor: viewModel.clrLvl3, // Aktif onay işareti rengi, AppViewModel nesnesinden alınır.
                      value: viewModel.getTaskValue(index), // Görevin tamamlanma durumu, AppViewModel nesnesinden alınır.
                      onChanged: (value) {
                        viewModel.setTaskValue(index, value!); // Görevin tamamlanma durumunu değiştirmek için AppViewModel'deki setTaskValue() fonksiyonunu çağırır.
                      },
                    ),
                    title: Text(
                      '$taskNumber. ${viewModel.getTaskTitle(index)}', // Görev numarası ve başlığı, AppViewModel nesnesinden alınır.
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
