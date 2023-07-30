// Görev (Task) sınıfı, bir görevin temel özelliklerini içeren veri modelini tanımlar.
class Task {
  String title;   // Görevin başlığı (title).
  bool complete;  // Görevin tamamlanma durumu (true: tamamlandı, false: tamamlanmadı).
  String date;    // Görevin tarihi (date).
  String time;    // Görevin saati (time).

  // Görev oluşturucu (constructor), zorunlu ve varsayılan değerli parametreler alır.
  Task({
    required this.title,    // Görev başlığı zorunludur ve belirtilmelidir.
    this.complete = false,  // Görev tamamlanma durumu varsayılan olarak false (tamamlanmamış) olarak ayarlanır.
    required this.date,     // Görev tarihi zorunludur ve belirtilmelidir.
    required this.time,     // Görev saati zorunludur ve belirtilmelidir.
  });
}
