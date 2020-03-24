import 'package:flutter/material.dart';
import 'package:invitationcard_maker/src/models/product_data.dart';
import 'package:invitationcard_maker/src/modules/demo.dart';
import 'package:invitationcard_maker/src/utils/InternetNetworkManager.dart';
import 'package:invitationcard_maker/src/utils/app_constants.dart';
import 'package:invitationcard_maker/src/utils/constants.dart';
import 'package:invitationcard_maker/src/utils/navigator_helper/navigation_helper.dart';
import 'package:invitationcard_maker/src/utils/network_http.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories;
  List<Product> productList = List<Product>();
  bool _isLoading = false;
  dynamic categoryDetail = [];
  // String id;

  @override
  void initState() {
    super.initState();

    InternetNetworkManager().checkInterConnection(context);

    if (isConnection) {
      getCategories();
    } else {
      showDialog();
    }
  }

  Widget showDialog() {
    return AlertDialog(
      actions: <Widget>[FlatButton(onPressed: () {Navigator.pop(context);}, child: Text('OK!!'))],
    );
  }

  getCategories() async {
    try {
      setState(() {
        _isLoading = true;
      });

      Map category =
          await NetworkHttp.getHttpMethod('${AppConstants.homeScreenUrl}');

      print("========================Category Response======================");
      print(category);
      print(category['body']['data']);

      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('id', id);
      print('----------------------------');

      setState(() {
        categoryDetail = category['body']['data'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('error while login $e');
    }
  }

  Widget _listofitem() {
    return Container(
      padding: EdgeInsets.only(bottom: 0.0, left: 8.0, right: 8.0, top: 8.0),
      child: ListView.separated(
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                EdgeInsets.only(bottom: 0.0, left: 8.0, right: 8.0, top: 8.0),
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.cyanAccent),
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessibility),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Dynamic Text'),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext contex, int index) {
          return SizedBox(
            height: 10.0,
          );
        },
      ),
    );
  }

  Widget _ofitem() {
    return Card(
      // margin: EdgeInsets.all(8.0),
      child: ListView.separated(
        // padding: EdgeInsets.all(8.0),
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: categoryDetail.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => NavigatorHelper.navigatetocategorypage(context),
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => BirthdayCategory(),
            //           settings: RouteSettings(
            //               arguments: categoryDetail[index]['id'])));
            // },
            child: Container(
              // padding: EdgeInsets.only(top:8.0),
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.cyanAccent),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        categoryDetail[index]['category_img'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    categoryDetail[index]['category_name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext contex, int index) {
          return SizedBox(
            height: 10.0,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextOverImage()));
                  print('button clicked');
                },
              ),
            ],
            automaticallyImplyLeading: true,
            title: Text(
              'Invitation Card Application',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.cyan,
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(
                text: 'Invitations',
              ),
              Tab(
                text: 'Geeting Cards',
              )
            ]),
          ),
          body: TabBarView(
            children: <Widget>[_listofitem(), _ofitem()],
          )),
    );
  }
}
