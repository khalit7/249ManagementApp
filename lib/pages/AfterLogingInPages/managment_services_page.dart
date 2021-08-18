//widgets
import 'package:management249/pages/AfterLogingInPages/my_qr_page.dart';
import 'package:management249/pages/AfterLogingInPages/scan_qr_page.dart';
import 'package:management249/provider/api_services.dart';
import 'package:management249/widgets/custom_drawer.dart';
import 'package:management249/widgets/loading_page.dart';
import 'package:management249/widgets/service_widget.dart';
//packages
import 'package:provider/provider.dart';
//main package
import 'package:flutter/material.dart';

class ManagmentServicesPage extends StatelessWidget {
  static final pageName = "ManagmentServicesPage";
  build(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text("Management services"),
          ),
          body: FutureBuilder(
              future: context.read<ApiService>().getUser(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingPage();
                } else
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // first row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ServiceWidget(
                              icon: Icons.scanner,
                              text: "Scan QR code",
                              onpressed: () {
                                Navigator.pushNamed(
                                    context, ScanQRPage.pageName);
                              },
                            ),
                            ServiceWidget(
                              icon: Icons.crop_free_rounded,
                              text: "My QR Code",
                              onpressed: () {
                                Navigator.pushNamed(context, MyQRPage.pageName);
                                print("pressed");
                              },
                            ),
                          ],
                        ),
                        // second row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ServiceWidget(
                              icon: Icons.book_online,
                              text: "Booking requests",
                              onpressed: () {
                                Navigator.pushNamed(
                                    context, ScanQRPage.pageName);
                              },
                            ),
                            ServiceWidget(
                              icon: Icons.construction,
                              text: "Resources",
                              onpressed: () {
                                Navigator.pushNamed(
                                    context, ScanQRPage.pageName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
              })),
    );
  }
}
