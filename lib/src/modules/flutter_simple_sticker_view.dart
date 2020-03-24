import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invitationcard_maker/src/modules/flutter_simple_sticker_image.dart';

class FlutterSimpleStickerView extends StatefulWidget {
  FlutterSimpleStickerView(
    this.source,
    this.widgetList, {
    Key key,
    this.widgetSize = 150.0,
    this.widgetMaxScale = 2.0,
    this.widgetMinScale = 0.5,
    this.panelHeight = 200.0,
    this.panelBackgroundColor = Colors.black,
    this.panelWidgetBackgroundColor = Colors.white10,
    this.panelWidgetcrossAxisCount = 4,
    this.panelWidgetAspectRatio = 1.0,
    this.devicePixelRatio = 3.0,
  }) : super(key: key);

  final Widget source;
  final List<Widget> widgetList;

  final double widgetSize;
  final double widgetMaxScale;
  final double widgetMinScale;

  final double panelHeight;
  final Color panelBackgroundColor;
  final Color panelWidgetBackgroundColor;
  final int panelWidgetcrossAxisCount;
  final double panelWidgetAspectRatio;
  final double devicePixelRatio;

  final _FlutterSimpleStickerViewState _flutterSimpleStickerViewState =
      _FlutterSimpleStickerViewState();

  Future<Uint8List> exportImage() async {
    await _flutterSimpleStickerViewState._prepareExport();

    Future<Uint8List> exportImage =
        _flutterSimpleStickerViewState.exportImage();
    print("export image success!");
    return exportImage;
  }

  @override
  _FlutterSimpleStickerViewState createState() =>
      _flutterSimpleStickerViewState;
}

class _FlutterSimpleStickerViewState extends State<FlutterSimpleStickerView> {
  _FlutterSimpleStickerViewState();

  Size viewport;

  List<FlutterSimpleStickerImage> attachedList = [];

  final GlobalKey key = GlobalKey();

  void attachWidget(Widget widget) {
    setState(() {
      attachedList.add(FlutterSimpleStickerImage(
        widget,
        key: Key("sticker_${attachedList.length}"),
        width: this.widget.widgetSize,
        height: this.widget.widgetSize,
        viewport: viewport,
        // maxScale: this.widget.widgetMaxScale,
        // minScale: this.widget.widgetMinScale,
        onTapRemove: (widget) {
          this.onTapRemoveSticker(widget);
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RepaintBoundary(
            key: key,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    viewport = viewport ??
                        Size(constraints.maxWidth, constraints.maxHeight);
                    return widget.source;
                  },
                ),
                Stack(children: attachedList, fit: StackFit.expand)
              ],
            ),
          ),
        ),
        Scrollbar(
          child: DragTarget(
            builder: (BuildContext context, List<String> candidateData,
                List<dynamic> rejectedData) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: this.widget.panelBackgroundColor,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.widgetList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: this.widget.panelWidgetBackgroundColor,
                            child: FlatButton(
                                onPressed: () {
                                  attachWidget(widget.widgetList[i]);
                                },
                                child: widget.widgetList[i]),
                          ));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: this.widget.panelWidgetcrossAxisCount,
                        childAspectRatio: this.widget.panelWidgetAspectRatio),
                  ),
                  height: this.widget.panelHeight);
            },
          ),
        ),
      ],
    );
  }

  Future<Uint8List> exportImage() async {
    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    var image =
        await boundary.toImage(pixelRatio: this.widget.devicePixelRatio);
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();

    return pngBytes;
  }

  void onTapRemoveSticker(FlutterSimpleStickerImage sticker) {
    setState(() {
      this.attachedList.removeWhere((s) => s.key == sticker.key);
    });
  }

  Future<void> _prepareExport() async {
    attachedList.forEach((s) {
      s.prepareExport();
    });
    await Future.delayed(const Duration(milliseconds: 500));
  }
}