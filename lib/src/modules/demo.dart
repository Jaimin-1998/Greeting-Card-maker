import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invitationcard_maker/src/modules/flutter_simple_sticker_view.dart';
import 'package:permission_handler/permission_handler.dart';

class Model {
  Widget w;
  DateTime id;
  Model();
}

class TextOverImage extends StatefulWidget {
  final String text;
  TextOverImage({Key key, this.text}) : super(key: key);

  @override
  _TextOverImageState createState() => _TextOverImageState();
}

class _TextOverImageState extends State<TextOverImage> {
  Offset offset = Offset.zero;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  String fontName;
  double _value = 20;
  bool viewFontFamilyBarVisible = false;
  bool viewFontSizeBarVisible = false;
  bool disabletext1 = true;
  StreamController _streamcontroller = StreamController();
  int _count = 1;
  List<Model> list = List();

  void disableTextField1() {
    setState(() {
      disabletext1 = false;
      print('text1 disable/delete');
    });
  }

  void enableTextField1() {
    setState(() {
      disabletext1 = true;
      print('text1 enable/show');
    });
  }

  void showFontFamilyContainer() {
    setState(() {
      viewFontFamilyBarVisible = true;
      print('font family open');
    });
  }

  void hideFontFamilyContainer() {
    setState(() {
      viewFontFamilyBarVisible = false;
      print('font family close');
    });
  }

  void showFontSizeContainer() {
    setState(() {
      viewFontSizeBarVisible = true;
      print('font size bar open');
    });
  }

  void hideFontSizeContainer() {
    setState(() {
      viewFontSizeBarVisible = false;
      print('font Size bar close');
    });
  }

  void changeFontSize(value) {
    setState(() {
      _value = value;
    });
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void changeFontFamily(String name) {
    setState(() {
      fontName = name;
    });
  }

  //  void removeWidget() {
  //     setTextOverImage.remove();
  //   }

  @override
  Widget build(BuildContext context) {
    Widget imageOnDisplay() {
      return Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                image: NetworkImage(
                    "https://thumbs.dreamstime.com/b/funny-face-baby-27701492.jpg"),
                fit: BoxFit.cover)),
      );
    }

    Widget fontSizeSlider() {
      return Container(
        // margin: EdgeInsets.only(top: 435),
        margin: EdgeInsets.only(top: 595),
        child: Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: viewFontSizeBarVisible,
          maintainSemantics: true,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Slider(
              activeColor: Colors.green,
              // divisions: 20,
              value: _value,
              onChangeEnd: (_) {
                setState(() {
                  viewFontSizeBarVisible = false;
                });
              },
              onChanged: (value) {
                setState(() {
                  _value = value;
                  print('font size $_value');
                  print('set font size called');
                });
              },
              max: 100,
              min: 15,
            ),
          ),
        ),
      );
    }

    Widget customTextDemo() {
      return Container(
        // margin: EdgeInsets.only(top: 435),
        margin: EdgeInsets.only(top: 595),
        child: Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: viewFontFamilyBarVisible,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Raleway',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('Raleway');
                    print('Roboto Font selected');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'DancingScript',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('DancingScript');
                    print('DancingScript Font selected');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('Montserrat');
                    print('Montserrat Font selecetd');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('Nunito');
                    print('Nunito font selected');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'BalooDa2',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('BalooDa2');
                    print('BalooDa2 font selected');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'OpenSans',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('OpenSans');
                    print('OpenSans font selected');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Teko',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('Teko');
                    print('Teko font selected');
                    hideFontFamilyContainer();
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Ubuntu',
                            color: Colors.black),
                      ),
                    ),
                  ),
                  onTap: () {
                    changeFontFamily('Ubuntu');
                    print('Ubuntu font selected');
                    hideFontFamilyContainer();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    _alertBox() {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text(
                      'Edit',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      print('Edittext click');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Demo1()));
                      print('Edit text page open');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.font_download),
                    title: Text(
                      'Font',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      print('font button clicked');
                      customTextDemo();
                      showFontFamilyContainer();
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.text_fields),
                    title: Text(
                      'Size',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      showFontSizeContainer();
                      print('size button clicked');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.color_lens),
                    title: Text(
                      'Color',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      print('Color button clicked');
                      showDialog(
                          context: context,
                          child: AlertDialog(
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      print('color set clicked');
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok!!'))
                              ],
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                  child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                                showLabel: true,
                                pickerAreaHeightPercent: 0.8,
                              ))));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text(
                      'Delete',
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      print('delete button clicked!!');
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          );
        },
      );
    }

    Widget textWidgetForImage() {
      return SizedBox(
            height: 300,
            width: 450,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => Demo1()));
                    _alertBox();
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        child: Text(
                            widget.text == null
                                ? ' Click here to add title  '
                                : widget.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: _value,
                                fontFamily: ('$fontName'),
                                color: pickerColor)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
    }

    Widget setTextOverImage() {
      return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              offset = Offset(
                  offset.dx + details.delta.dx, offset.dy + details.delta.dy);
            });
          },
          child: textWidgetForImage()
              // Visibility(
              //   maintainSize: true,
              //   maintainSemantics: true,
              //   maintainAnimation: true,
              //   maintainState: true,
              //   visible: disabletext1,
              // child:
              
        ),
        // ),
      );
    }

    Widget customList() {
      return Container(
        height: 70,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            color: Colors.white),
        // margin: EdgeInsets.only(top: 490.0),
        margin: EdgeInsets.only(top: 650.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('Edittext click');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Demo1()));
                print('Edit text page open');
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.keyboard,
                      color: Colors.black,
                      size: 35,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('font button clicked');
                customTextDemo();
                showFontFamilyContainer();
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.font_download,
                      color: Colors.black,
                      size: 35,
                    ),
                    Text(
                      'Font',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showFontSizeContainer();
                print('size button clicked');
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.format_size,
                      color: Colors.black,
                      size: 35,
                    ),
                    Text(
                      'Size',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Color button clicked');
                showDialog(
                    context: context,
                    child: AlertDialog(
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                print('color set clicked');
                                Navigator.pop(context);
                              },
                              child: Text('Ok!!'))
                        ],
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                            child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                          showLabel: true,
                          pickerAreaHeightPercent: 0.8,
                        ))));
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.color_lens,
                      color: Colors.black,
                      size: 35,
                    ),
                    Text(
                      'Color',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('align button clicked');
              },
              child: SizedBox(
                height: 65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.format_align_center,
                      color: Colors.black,
                      size: 35,
                    ),
                    Text(
                      'Align',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    FlutterSimpleStickerView _stickerView = FlutterSimpleStickerView(
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://thumbs.dreamstime.com/b/funny-face-baby-27701492.jpg"))),
        ),
        [
          Image.asset('assets/images/audi.png'),
          Image.asset('assets/images/bag.png'),
          Image.asset('assets/images/book-cover-placeholder-dark.png'),
          Image.asset('assets/images/book-cover-placeholder-light.png'),
          Image.asset('assets/images/ferrari.png'),
          Image.asset('assets/images/FluttterLogo.png'),
          Image.asset('assets/images/icon.png'),
          Image.asset('assets/images/images.jpg'),
          Image.asset('assets/images/lemborghini.png'),
          Image.asset('assets/images/mercidis.png'),
          Image.asset('assets/images/rollesroyce.png'),
          Image.asset('assets/images/suzuki.png'),
          Image.asset('assets/images/toyota.png'),
          Image.asset('assets/images/trousers.png'),
          Image.asset('assets/images/volkswagon.png'),
          Image.asset('assets/images/tshirt.png'),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
          // setTextOverImage(),
        ]);

    // addNewTextField() {
    //   return ListView.builder(
    //     itemBuilder: (BuildContext context, int index) {
    //       Widget widget = list.elementAt(index);
    //       return widget;
    //     },
    //     itemCount: list.length,
    //   );
    // }

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {
              addWidget;
            }),
            IconButton(
                icon: Icon(Icons.delete), onPressed: () => disableTextField1()),
          ],
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text('Text Over Image Example'),
        ),
        body:
            // _stickerView
            Container(
                child: Stack(
          children: <Widget>[
            imageOnDisplay(),
            customTextDemo(),
            fontSizeSlider(),
            customList(),
            setTextOverImage(),
            // list.map((m) => m.w).toList()
            // addNewTextField()
          ],
        ))
        // child: StreamBuilder(
        //     stream: _streamcontroller.stream,
        //     builder: (context, index) {
        //       return Stack(
        //         children: <Widget>[
        //           setTextOverImage(),
        //           imageOnDisplay(),
        //           customTextDemo(),
        //           fontSizeSlider(),
        //           customList()
        //         ],
        //       );
        //     })),
        );
  }

  addWidget() {
    Model m = new Model();
    m.id = DateTime.now();
    m.w = Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              offset = Offset(
                  offset.dx + details.delta.dx, offset.dy + details.delta.dy);
            });
          },
          child:
              // Visibility(
              //   maintainSize: true,
              //   maintainSemantics: true,
              //   maintainAnimation: true,
              //   maintainState: true,
              //   visible: disabletext1,
              // child:
              SizedBox(
            height: 300,
            width: 450,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    deleteWidget(m.id);
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => Demo1()));
                    // _alertBox();
                  },
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        child: Text(
                            widget.text == null
                                ? ' Click here to add title  '
                                : widget.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: _value,
                                fontFamily: ('$fontName'),
                                color: pickerColor)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // ),
      );
    setState((){
      list.add(m);
    });
  }

  deleteWidget(DateTime id) {
    setState(() {
      print('reached');
      list.removeWhere((m) => m.id == id);
    });
  }
}

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 150.0, 16.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Text',
                  hintText: 'Add Text Here',
                ),
                maxLines: 5,
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    _setTextOnImage(context);
                    print('data Pass');
                    print('Edit text page close');
                  },
                  color: Colors.cyan,
                  child: Text(
                    'Set Text on Image',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _setTextOnImage(BuildContext context) {
    String dataSend = _textController.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TextOverImage(text: dataSend)));
  }
}