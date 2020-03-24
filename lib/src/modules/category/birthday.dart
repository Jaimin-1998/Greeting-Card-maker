import 'package:flutter/material.dart';
import 'package:invitationcard_maker/src/models/category.dart';
import 'package:invitationcard_maker/src/utils/InternetNetworkManager.dart';
import 'package:invitationcard_maker/src/utils/app_constants.dart';
import 'package:invitationcard_maker/src/utils/constants.dart';
import 'package:invitationcard_maker/src/utils/navigator_helper/navigation_helper.dart';
import 'package:invitationcard_maker/src/utils/network_http.dart';

class BirthdayCategory extends StatefulWidget {
  @override
  _BirthdayCategoryState createState() => _BirthdayCategoryState();
}

class _BirthdayCategoryState extends State<BirthdayCategory> {
  List categories;
  List<Data> datalist = List<Data>();
  bool _isLoading = false;
  dynamic categoryDetails = [];

  @override
  void initState() {
    super.initState();

    InternetNetworkManager().checkInterConnection(context);
    if (isConnection) {
      getdata();
    } else {
      AlertDialog(
        content: Text('Connect to Internet!!'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => NavigatorHelper.navigatoclose(context),
              child: Text('ok!!'))
        ],
      );
    }
  }

  getdata() async {
    try {
      setState(() {
        _isLoading = true;
      });
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // String id = pref.getString('id');
      // String id = ModalRoute.of(context).settings.arguments;
      Map category =
          await NetworkHttp.getHttpMethod('${AppConstants.subscreenUrl}');

      print('=======================Birthday Category Response==========================');
      print(category);
      print(category['body']['data']);

      print('-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      setState(() {
        categoryDetails = category['body']['data'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('error while load data $e');
    }
  }

  Widget _birthdayCategory() {
    return Container(
      // decoration: BoxDecoration(border: Border.all()),
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: categoryDetails.length,
          itemBuilder: (BuildContext context, int index) {
            print('+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+');
            print('');
            return InkWell(
              onTap: () {
                print(categoryDetails[index]['img_name']);
              },
              child: Hero(
                tag: '',
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: 150,
                  width: 105,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          categoryDetails[index]['img_url_jpg'],
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                  ),
                  child: Container(
                    decoration: BoxDecoration(),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      categoryDetails[index]['img_name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: _birthdayCategory(),
    );
  }
}
