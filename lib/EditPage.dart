import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import 'Data.dart';

class EditPage extends StatefulWidget {
  int index, categoryIndex;

  EditPage(this.index, this.categoryIndex);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Color textBgPickerColor = Colors.grey;
  Color textBgCurrentColor = Colors.transparent;
  Color fontPickerColor = Colors.grey;
  Color fontCurrentColor = Colors.black;
  Color bgPickerColor = Colors.grey;
  Color bgCurrentColor = Colors.transparent;
  double textSize = 25;
  List<String> image = [
    "https://images.unsplash.com/photo-1693040516624-a22f0906faab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
    "https://images.unsplash.com/photo-1677746792119-d8f8ee8e77f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1668162692136-9c490f102de2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=700&q=60",
    "https://images.unsplash.com/photo-1682687982107-14492010e05e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=700&q=60",
  ];
  String bgImage =
      "https://images.unsplash.com/photo-1693040516624-a22f0906faab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80";
  bool bgColor = false;

  // void changeColor(Color color) {
  //   setState(() => pickerColor = color);
  // }

  String folderpath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createFolder();
  }

  _createFolder() async {
    const folderName = "Shayri App2023";
    final path = Directory("storage/emulated/0/DCIM/$folderName");
    if ((await path.exists())) {

      print("exist");
    } else {
      print("not exist");
      path.create();
    }
    folderpath = path.path;
  }

  @override
  Widget build(BuildContext context) {
    return true
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Edit Page"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: WidgetsToImage(
                    controller: controller,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      height: 600,
                      width: 400,
                      decoration: bgColor
                          ? BoxDecoration(color: bgCurrentColor)
                          : BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(bgImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                      child: Container(
                        color: textBgCurrentColor,
                        width: 300,
                        child: SelectableText(
                            Data.list[widget.categoryIndex][widget.index],
                            style: TextStyle(
                              fontSize: textSize,
                              color: fontCurrentColor,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey.shade900,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Pick a color"),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor:
                                                      textBgPickerColor,
                                                  onColorChanged: (value) {
                                                    textBgPickerColor = value;
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      textBgCurrentColor =
                                                          textBgPickerColor;
                                                    });

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Got it"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        color: Colors.grey[850],
                                        height: 100,
                                        width: 100,
                                        margin: const EdgeInsets.all(2.5),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Text BG Color",
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Pick a color"),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: fontPickerColor,
                                                  onColorChanged: (value) {
                                                    fontPickerColor = value;
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      fontCurrentColor =
                                                          fontPickerColor;
                                                    });

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Got it"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        color: Colors.grey[850],
                                        height: 100,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(2.5),
                                        child: const Text(
                                          "Font Color",
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                                color: Colors.black54,
                                                height: 200,
                                                child: StatefulBuilder(
                                                  builder:
                                                      (context, setState1) {
                                                    return Slider(
                                                      activeColor: Colors.white,
                                                      inactiveColor:
                                                          Colors.white30,
                                                      value: textSize,
                                                      onChanged: (value) {
                                                        setState1(() {
                                                          setState(() {
                                                            textSize = value;
                                                          });
                                                        });
                                                      },
                                                      divisions: 10,
                                                      min: 10,
                                                      max: 40,
                                                    );
                                                  },
                                                ));
                                          },
                                        );
                                      },
                                      child: Container(
                                        color: Colors.grey[850],
                                        height: 100,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(2.5),
                                        child: const Text(
                                          "Font Size",
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Pick a color"),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: bgPickerColor,
                                                  onColorChanged: (value) {
                                                    bgPickerColor = value;
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      bgCurrentColor =
                                                          bgPickerColor;
                                                    });
                                                    bgColor = true;
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Got it"),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   builder: (context) {
                                        //     return Container(
                                        //       color: Colors.pink,
                                        //       height: 200,
                                        //       child: GridView.builder(
                                        //         itemCount: listcolor.length,
                                        //         gridDelegate:
                                        //             const SliverGridDelegateWithFixedCrossAxisCount(
                                        //                 childAspectRatio: 1,
                                        //                 crossAxisCount: 7),
                                        //         itemBuilder: (context, index) {
                                        //           return GestureDetector(
                                        //             onTap: () {
                                        //               setState(() {
                                        //                 backgroundColor =
                                        //                     listcolor[index];
                                        //               });
                                        //               if (backgroundColor ==
                                        //                   listcolor[0]) {
                                        //                 bgColor = false;
                                        //               } else {
                                        //                 bgColor = true;
                                        //               }
                                        //             },
                                        //             child: Container(
                                        //               margin:
                                        //                   const EdgeInsets.all(
                                        //                       5),
                                        //               color: listcolor[index],
                                        //             ),
                                        //           );
                                        //         },
                                        //       ),
                                        //     );
                                        //   },
                                        // );
                                      },
                                      child: Container(
                                          color: Colors.grey[850],
                                          height: 100,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.all(2.5),
                                          child: const Text(
                                            "BG Color",
                                            style: TextStyle(fontSize: 20),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.grey.shade900,
                                              height: 200,
                                              child: GridView.builder(
                                                itemCount: image.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        childAspectRatio: 1,
                                                        crossAxisCount: 7),
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        bgImage = image[index];
                                                      });
                                                      bgColor = false;
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            image[index],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        color: Colors.grey[850],
                                        height: 100,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.all(2.5),
                                        child: const Text(
                                          "Bg Image",
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller
                                            .capture()
                                            .then((value) async {

                                          DateTime dd = DateTime.now();

                                          String imagenam =
                                              "Image${dd.hour}-${dd.second}.jpg";
                                          String imagepath =
                                              "$folderpath/$imagenam";

                                          File file = File(imagepath);
                                          List<int> byted = value as List<int>;

                                          file.writeAsBytes(byted);

                                          await file.create();
                                          Share.shareFiles([file.path],
                                              text:
                                                  "https://play.google.com/googleplaygames?pcampaignid=merch-FCC-gpg-in-openbeta-launch-web");
                                        });
                                      },
                                      child: Container(
                                          color: Colors.grey[850],
                                          height: 100,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.all(2.5),
                                          child: const Icon(
                                            Icons.share,
                                            size: 30,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  WidgetsToImageController controller = WidgetsToImageController();
}
// Slider
// Emjoi = List
// Font color
// Share = Permmision

// Device == Android Version = 11   - 13+  Photo Media
// Read External STorage ;
