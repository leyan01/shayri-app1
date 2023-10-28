import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri_app/SecondPage.dart';

import 'Data.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forpermmision();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Quotes"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ListView.builder(
          itemCount: Data.mainTitle.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage(index);
                    },
                  ),
                );
              },
              leading: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Text(
                  Data.icon[index],
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              title: Text(
                Data.mainTitle[index],
                style: const TextStyle(fontSize: 20),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> forpermmision() async {
    var status = await Permission.photos.status;
    var status1 = await Permission.storage.status;
    if (status.isDenied || status1.isDenied) {
      Permission.photos.request();
      Permission.storage.request();
    }

    if (status.isGranted) {
      Fluttertoast.showToast(
          msg: "All Permmision Are Granted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
