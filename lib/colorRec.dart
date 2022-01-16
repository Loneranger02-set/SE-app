// import 'dart:js_util';
// import 'package:image/image.dart' as img;
// import 'package:flutter/material.dart';
// class colorRecogn extends StatefulWidget {
//   @override
//   MyHomePageState createState() => new MyHomePageState();
// }
//
// class MyHomePageState extends State<colorRecogn> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Popup Demo'),
//         ),
//         body: new MyWidget());
//   }
// }
//
// class MyWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new MyWidgetState();
//   }
// }
//
// class MyWidgetState extends State<MyWidget> {
//   double posx = 100.0;
//   double posy = 100.0;
//
//   void onTapDown(BuildContext context, TapDownDetails details) {
//     print('${details.globalPosition}');
//     print(img.pix)
//     final RenderBox box = context.findRenderObject();
//     final Offset localOffset = box.globalToLocal(details.globalPosition);
//     setState(() {
//       posx = localOffset.dx;
//       posy = localOffset.dy;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new GestureDetector(
//       onTapDown: (TapDownDetails details) => onTapDown(context, details),
//       child: new Stack(fit: StackFit.expand, children: <Widget>[
//         // Hack to expand stack to fill all the space. There must be a better
//         // way to do it.
//         new Container(color: Colors.white),
//         new Positioned(
//           child: new Text('hello'),
//           left: posx,
//           top: posy,
//         )
//       ]),
//     );
//   }
// }
//








// import 'dart:typed_data';
//
// import 'package:image/image.dart' as img;
// import 'package:flutter/rendering.dart';
// import 'package:object_detection/colorRec.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// class colorRecogn extends StatefulWidget {
//   //static const routeName = '/';
//
//   @override
//   _ColorDetectState createState() => _ColorDetectState();
// }
//
// class _ColorDetectState extends State<colorRecogn> {
//   final coverData =
//       'https://www.bing.com/images/search?q=Cat&FORM=IQFRBA&id=D81EDCF0F54945B5EAE6B44C21D2B680AC55AB8C';
//   img.Image photo;
//
//   void setImageBytes(imageBytes) {
//     print("setImageBytes");
//     List<int> values = imageBytes.buffer.asUint8List();
//     photo = null;
//     photo = img.decodeImage(values);
//   }
//
//   // image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
//   int abgrToArgb(int argbColor) {
//     print("abgrToArgb");
//     int r = (argbColor >> 16) & 0xFF;
//     int b = argbColor & 0xFF;
//     return (argbColor & 0xFF00FF00) | (b << 16) | r;
//   }
//
//   // FUNCTION
//
//   Future<Color> _getColor() async {
//     print("_getColor");
//     Uint8List data;
//
//     try{
//       data =
//           (await NetworkAssetBundle(
//               Uri.parse(coverData)).load(coverData))
//               .buffer
//               .asUint8List();
//     }
//     catch(ex){
//       print(ex.toString());
//     }
//
//     print("setImageBytes....");
//     setImageBytes(data);
//
// //FractionalOffset(1.0, 0.0); //represents the top right of the [Size].
//     double px = 1.0;
//     double py = 0.0;
//
//     int pixel32 = photo.getPixelSafe(px.toInt(), py.toInt());
//     int hex = abgrToArgb(pixel32);
//     print("Value of int: $hex ");
//
//     return Color(hex);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             flex: 2,
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(coverData),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child:
//
//             FutureBuilder(
//                 future: _getColor(),
//                 builder: (_, AsyncSnapshot<Color> data){
//                   if (data.connectionState==ConnectionState.done){
//                     return Container(
//                       color: data.data,
//                     );
//                   }
//                   return CircularProgressIndicator();
//                 }
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 MaterialButton(
//                   elevation: 5.0,
//                   padding: EdgeInsets.all(15.0),
//                   color: Colors.grey,
//                   child: Text("Get Sizes"),
//                   onPressed: null,
//                 ),
//                 MaterialButton(
//                   elevation: 5.0,
//                   color: Colors.grey,
//                   padding: EdgeInsets.all(15.0),
//                   child: Text("Get Positions"),
//                   onPressed: _getColor,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;

class colorRecogn extends StatefulWidget {
  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<colorRecogn> {
  String imagePath = 'assets/images/index.jpg';
  GlobalKey imageKey = GlobalKey();
  GlobalKey paintKey = GlobalKey();

  // CHANGE THIS FLAG TO TEST BASIC IMAGE, AND SNAPSHOT.
  bool useSnapshot = true;

  // based on useSnapshot=true ? paintKey : imageKey ;
  // this key is used in this example to keep the code shorter.
  GlobalKey currentKey;

  final StreamController<Color> _stateController = StreamController<Color>();
  img.Image photo;

  @override
  void initState() {
    currentKey = useSnapshot ? paintKey : imageKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String title = useSnapshot ? "snapshot" : "basic";
    return Scaffold(
      appBar: AppBar(title: Text("Color picker $title")),
      body: StreamBuilder(
          initialData: Colors.green[500],
          stream: _stateController.stream,
          builder: (buildContext, snapshot) {
            Color selectedColor = snapshot.data ?? Colors.green;
            return Stack(
              children: <Widget>[
                RepaintBoundary(
                  key: paintKey,
                  child: GestureDetector(
                    onPanDown: (details) {
                      searchPixel(details.globalPosition);
                    },
                    onPanUpdate: (details) {
                      searchPixel(details.globalPosition);
                    },
                    child: Center(
                      child: Image.asset(
                        imagePath,
                        key: imageKey,
                        //color: Colors.red,
                        //colorBlendMode: BlendMode.hue,
                        //alignment: Alignment.bottomRight,
                        fit: BoxFit.none,
                        //scale: .8,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(70),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedColor,
                      border: Border.all(width: 2.0, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                ),
                Positioned(
                  child: Text('${selectedColor}',
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black54)),
                  left: 114,
                  top: 95,
                ),
              ],
            );
          }),
    );
  }

  void searchPixel(Offset globalPosition) async {
    if (photo == null) {
      await (useSnapshot ? loadSnapshotBytes() : loadImageBundleBytes());
    }
    _calculatePixel(globalPosition);
  }

  void _calculatePixel(Offset globalPosition) {
    RenderBox box = currentKey.currentContext.findRenderObject();
    Offset localPosition = box.globalToLocal(globalPosition);

    double px = localPosition.dx;
    double py = localPosition.dy;

    if (!useSnapshot) {
      double widgetScale = box.size.width / photo.width;
      print(py);
      px = (px / widgetScale);
      py = (py / widgetScale);
    }

    int pixel32 = photo.getPixelSafe(px.toInt(), py.toInt());
    int hex = abgrToArgb(pixel32);

    _stateController.add(Color(hex));
  }

  Future<void> loadImageBundleBytes() async {
    ByteData imageBytes = await rootBundle.load(imagePath);
    setImageBytes(imageBytes);
  }

  Future<void> loadSnapshotBytes() async {
    RenderRepaintBoundary boxPaint = paintKey.currentContext.findRenderObject();
    ui.Image capture = await boxPaint.toImage();
    ByteData imageBytes =
    await capture.toByteData(format: ui.ImageByteFormat.png);
    setImageBytes(imageBytes);
    capture.dispose();
  }

  void setImageBytes(ByteData imageBytes) {
    List<int> values = imageBytes.buffer.asUint8List();
    photo = null;
    photo = img.decodeImage(values);
  }
}

// image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
int abgrToArgb(int argbColor) {
  int r = (argbColor >> 16) & 0xFF;
  int b = argbColor & 0xFF;
  return (argbColor & 0xFF00FF00) | (b << 16) | r;
}