import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri_app/Data.dart';

import 'EditPage.dart';

class ThirdPage extends StatefulWidget {
  int index;
  int categoryIndex;

  ThirdPage(this.index, this.categoryIndex);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  PageController pageController = PageController();
  String quote = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: const Text("Quotes"),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white30,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1693040516624-a22f0906faab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"),
                  fit: BoxFit.fill)),
          // padding: EdgeInsets.symmetric(vertical: 50),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      widget.index = value;
                    });
                  },
                  itemCount: Data.list[widget.categoryIndex].length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.all(30),
                        color: Colors.white30,
                        child: SelectableText(
                          quote = Data.list[widget.categoryIndex][widget.index],
                          style: const TextStyle(
                              fontSize: 27,
                              letterSpacing: 1.5,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Spacer(),
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.grey[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (widget.index > 0) {
                            widget.index -= 1;
                            // quote = Data.list[widget.categoryIndex][widget.index];
                            pageController.animateToPage(widget.index,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate);
                            setState(() {});
                          } else {
                            Fluttertoast.showToast(
                                msg: "No more",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2.5),
                          color: Colors.grey[850],
                          height: double.infinity,
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Share.share(
                              '${Data.list[widget.categoryIndex][widget.index]}');
                        },
                        child: Container(
                            margin: const EdgeInsets.all(2.5),
                            color: Colors.grey[850],
                            height: double.infinity,
                            child: const Icon(Icons.share)),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return EditPage(
                                    widget.index, widget.categoryIndex);
                              },
                            ),
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.all(2.5),
                            color: Colors.grey[850],
                            height: double.infinity,
                            child: const Icon(Icons.edit)),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (widget.index <
                              Data.list[widget.categoryIndex].length - 1) {
                            widget.index += 1;
                            // quote = Data.list[widget.categoryIndex][widget.index];
                            pageController.animateToPage(widget.index,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate);
                            setState(() {});
                          } else {
                            Fluttertoast.showToast(
                                msg: "No more",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.all(2.5),
                            color: Colors.grey[850],
                            height: double.infinity,
                            child: const Icon(Icons.arrow_forward_ios)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
