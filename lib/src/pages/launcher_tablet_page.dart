import 'package:animate_do/animate_do.dart';
import 'package:design_qpp/src/models/layout_model.dart';
import 'package:design_qpp/src/routes/routes.dart';
import 'package:design_qpp/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatefulWidget {
  @override
  _LauncherTabletPageState createState() => _LauncherTabletPageState();
}

class _LauncherTabletPageState extends State<LauncherTabletPage> {

  bool openMenu = true;


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final loyoutModel = Provider.of<LayoutModel>(context); 

    return Scaffold(
    
      appBar: AppBar(
      
      title: Center(child: Text('Diseños en Flutter - Tablet', style: TextStyle(color:(appTheme.darkTheme)? Colors.black: appTheme.currentTheme.primaryColorLight),)),
      backgroundColor: appTheme.currentTheme.accentColor,
      iconTheme: new IconThemeData(color: (appTheme.darkTheme)? Colors.black: appTheme.currentTheme.primaryColorLight),
      leading: Builder(
        builder: (context) => IconButton(
            icon: (this.openMenu)? SlideInLeft(child: new Icon(Icons.chevron_left)) : SlideInRight(child: new Icon(Icons.chevron_right)),
            onPressed: () => {
            setState(() {
                this.openMenu = !this.openMenu;
            })
            }
          ),
        ),
      ),
      drawer: new Drawer(),
      
      body: FadeIn(
              child: Row(children: <Widget>[
          Container(
            width: (openMenu)? 300 : 0,
            height: double.infinity,
            child: _PrincipalMenu()
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme.darkTheme) ? Colors.grey: appTheme.currentTheme.accentColor 
          ),
          Expanded(
            child: loyoutModel.currentPage
          )
  
        ],),
      ),
    
      
      //body: NavigationPage()
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRouter.length,
      itemBuilder: (context, i )=> ListTile(
        leading: FaIcon(pageRouter[i].icon, color: appTheme.accentColor),
        title: Text(pageRouter[i].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
/*           Navigator.push(
            context,
              MaterialPageRoute(
                builder: (BuildContext context) => pageRouter[i].page)
          );
           */
          final loyoutModel = Provider.of<LayoutModel>(context, listen: false); 

          loyoutModel.currentPage = pageRouter[i].page;

        },
      ),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

        return Drawer(
              child: Container(
            child: Column(children: [
              
              SafeArea(
                  child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  child: CircleAvatar(
                    backgroundColor: accentColor,
                    child: Text('DM', style: TextStyle(fontSize: 50),),),
                ),
              ),
              Expanded(
                child: _OptionsList(),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.moon, color: accentColor),
                title: Text('Dark mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  onChanged: (value) {

                    appTheme.darkTheme = value;
                  },
                ),
              ),
              SafeArea(
                bottom: true,
                top: false,
                left: false,
                right: false,
                child: ListTile(
                  leading: Icon(Icons.add_to_home_screen, color: accentColor),
                  title: Text('Custom theme'),
                  trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      appTheme.customTheme = value;
                    },
                  ),
                ),
              ),
    
            ],),
          ),
        );
      }
    }
    
