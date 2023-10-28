import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shayri_app/Data.dart';

import 'ThirdPage.dart';

class SecondPage extends StatelessWidget {
  int index;
  SecondPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Data.mainTitle[index],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
          itemCount: Data.list[index].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ThirdPage(index, this.index);
                    },

                  ));
                },

                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(13),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: const [
                        0.1,
                        0.4,
                        0.6,
                        0.9,
                      ],
                      colors: (Data.gradient.toList()..shuffle()).first,
                    ),
                  ),
                  child: Text(
                    Data.list[this.index][index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
