import 'package:flutter/material.dart';

import '../Models/Cafe.dart';
import '../DB/Cafe.dart';

import './Card/CafeCard.dart';
import './Card/CafeInformation.dart';
import './Card/CardPadding.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0, bottom: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Cafe>>(
              future: getCafeList(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Container(
                    child: Autocomplete<Cafe>(
                      displayStringForOption: (Cafe option) => (option.name! + " " + option.sub_name!),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if(textEditingValue.text == '')
                          return const Iterable<Cafe>.empty();
                        return snapshot.data!.where((Cafe option) {
                          return option.name!.contains(textEditingValue.text);
                        });
                      },
                      onSelected: (Cafe selection) {
                        // print(selection.name);
                      },
                      fieldViewBuilder: (BuildContext context, TextEditingController controller, FocusNode focusNode, VoidCallback voidCallback) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.close),
                              color: Colors.black,
                              onPressed: () {
                                setState(() { controller.text = ''; });
                              }
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: ' 취향에 맞는 카페를 검색해 보세요!',
                            hintStyle: TextStyle(fontSize: 15.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0)
                          ),
                        );
                      },
                    )
                  );
                }

                else {
                  return Text('');
                }
              }
            ),
            Container(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '오늘의 카페 소식',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white
                        )
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18.0)
                    ],
                  ),
                  CafeInformation()
                ],
              )
            ),

            Container(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '이 카페 어때요?',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white
                        )
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18.0)
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 200.0,
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              CafeCard(context),
                              CardPadding(),
                              CafeCard(context),
                              CardPadding(),
                              CafeCard(context),
                            ],
                          )
                        )
                      ],
                    )
                  )
                ]
              )
            ),
          ]
        )
      )
    );
  }
}
