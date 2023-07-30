import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view_models/app_view_model.dart';
import 'package:todo/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:todo/views/bottom_sheets/user_bottom_sheet_view.dart';

// Başlık bölümünü oluşturan sınıf.
class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "Merhaba,",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: viewModel.clrLvl4, // Metin rengi, AppViewModel nesnesinden alınır.
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              viewModel.username, // Kullanıcı adı, AppViewModel nesnesinden alınır.
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: viewModel.clrLvl4, // Metin rengi, AppViewModel nesnesinden alınır.
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Çöp Kutusu simgesi
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    viewModel.bottomSheetBuilder(
                      DeleteBottomSheetView(),
                      context,
                    ); // Görev silme alt tabakasını (DeleteBottomSheetView) çağırarak gösterir.
                  },
                  child: Icon(
                    Icons.delete,
                    color: viewModel.clrLvl3, // Simge rengi, AppViewModel nesnesinden alınır.
                    size: 35,
                  ),
                ),
              ),
            ),

            // Kullanıcı simgesi
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    viewModel.bottomSheetBuilder(
                      UserBottomSheetView(),
                      context,
                    ); // Kullanıcı adı güncelleme alt tabakasını (UserBottomSheetView) çağırarak gösterir.
                  },
                  child: Icon(
                    Icons.account_circle,
                    color: viewModel.clrLvl3, // Simge rengi, AppViewModel nesnesinden alınır.
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
