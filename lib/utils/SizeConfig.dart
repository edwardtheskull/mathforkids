import 'package:flutter/widgets.dart';
import 'package:mathforkids/utils/Imports.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double TextFontSize;
  static double TextFieldFontSize;
  static double ButtonWidth;
  static double SmallButtonWidth;
  static double ButtonHeight;
  static double ButtonTextSize;
  static double AppbarFontSize;
  static double LargeButtonTextSize;
  static double SquareButton;
  static double HeaderTextFontSize;
  static double SmallTextFontSize;
  static double SmallIconSize;
  static double MiniTextFontSize;
  static double XSMiniTextFontSize;
  static double ScreenHeight;
  static double SmallScreenHeight;
  static double Createquestionbutton;
  static double XSScreenHeight;
  static double HalfScreenHeight;
  static double SpecTestScreenHeight;
  static double AppBarSize;
  static double SmallWindowHeight;
  static double XSHalfScreenSize;
  static double SecondSmallWindowHeight;
  static double SecondScreenHeight;
  static double XSSH;
  static double TeacherPageHeight;

  double ShortestLength;
  double LongestLength;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 100;

    if(screenWidth < screenHeight)
    {
      ShortestLength = screenWidth;
      LongestLength = screenHeight;
    }
    else
    {
      ShortestLength = screenHeight;
      LongestLength = screenWidth;
    }

    TextFontSize = safeBlockHorizontal*6;
    TextFieldFontSize = safeBlockHorizontal*4;
    ButtonWidth = MediaQuery.of(context).size.width/1.5;
    ButtonHeight = MediaQuery.of(context).size.height/9;
    ButtonTextSize = safeBlockHorizontal * 7;
    AppbarFontSize = SizeConfig.safeBlockHorizontal * 8;
    LargeButtonTextSize = 50;
    SquareButton = MediaQuery.of(context).size.width/4.0;
    HeaderTextFontSize = safeBlockHorizontal*5.5;
    SmallTextFontSize = safeBlockHorizontal*5;
    SmallIconSize = 25;
    MiniTextFontSize = safeBlockHorizontal*4.5;
    XSMiniTextFontSize = safeBlockHorizontal*4;
    SmallButtonWidth = MediaQuery.of(context).size.width/2.2;
    Createquestionbutton = safeBlockHorizontal*5;

    if(ShortestLength < 400 && LongestLength > 650)
    {
        ScreenHeight = MediaQuery.of(context).size.height*0.93;
        SecondScreenHeight = ScreenHeight;
        SmallScreenHeight = ScreenHeight * 0.8;
        SmallWindowHeight = SmallScreenHeight/1.5;
        SecondSmallWindowHeight = SmallWindowHeight;
        XSScreenHeight = ScreenHeight * 0.13;
        XSSH = XSScreenHeight;
        XSHalfScreenSize = SmallWindowHeight*1.25;
        HalfScreenHeight = ScreenHeight * 0.82;
        SpecTestScreenHeight = ScreenHeight * 0.81;
        AppBarSize = MediaQuery.of(context).size.height/12;
        TeacherPageHeight = ScreenHeight * 0.81;

    }
      else if(ShortestLength < 650 && ShortestLength > 470 && LongestLength > 800)
        {

          ScreenHeight = MediaQuery.of(context).size.height*0.85;
            SecondScreenHeight = ScreenHeight;
            SmallScreenHeight = ScreenHeight * 0.6;
            SmallWindowHeight = SmallScreenHeight/1.6;
            SecondSmallWindowHeight = SmallWindowHeight*1.8;
            XSScreenHeight = ScreenHeight * 0.13;
            XSSH = XSScreenHeight;
            XSHalfScreenSize = SmallWindowHeight*2.1;
            HalfScreenHeight = ScreenHeight* .9 ;
            SpecTestScreenHeight = ScreenHeight * .9;
            AppBarSize = MediaQuery.of(context).size.height/12;
                 TeacherPageHeight = ScreenHeight * 0.83;

        }
    else if(ShortestLength < 650 && ShortestLength > 470)
    {

      ScreenHeight = MediaQuery.of(context).size.height*0.95;
        SecondScreenHeight = ScreenHeight;
        SmallScreenHeight = ScreenHeight * 0.6;
        SmallWindowHeight = SmallScreenHeight/1.6;
        SecondSmallWindowHeight = SmallWindowHeight*1.5;
        XSScreenHeight = ScreenHeight * 0.13;
        XSSH = XSScreenHeight;
        XSHalfScreenSize = SmallWindowHeight*1.9;
        HalfScreenHeight = ScreenHeight * 0.6;
        SpecTestScreenHeight = ScreenHeight * 0.83;
        AppBarSize = MediaQuery.of(context).size.height/12;
             TeacherPageHeight = ScreenHeight * 0.83;

    }
     else if(ShortestLength < 600 && ShortestLength > 365 && LongestLength < 600)
            {

              ScreenHeight = MediaQuery.of(context).size.height;
                SecondScreenHeight = ScreenHeight;
                SmallScreenHeight = ScreenHeight * 0.6;
                SmallWindowHeight = SmallScreenHeight/1.6;
                SecondSmallWindowHeight = SmallWindowHeight*0.94;
                XSScreenHeight = ScreenHeight * 0.13;
                XSSH = XSScreenHeight;
                XSHalfScreenSize = SmallWindowHeight*1.6;
                HalfScreenHeight = ScreenHeight * 0.7;
                SpecTestScreenHeight = ScreenHeight * 0.60;
                AppBarSize = MediaQuery.of(context).size.height/12;
                     TeacherPageHeight = ScreenHeight * 0.70;

            }
     else if(ShortestLength < 650 && ShortestLength > 365)
        {
          ScreenHeight = MediaQuery.of(context).size.height*.9;
            SecondScreenHeight = ScreenHeight;
            SmallScreenHeight = ScreenHeight * 0.6;
            SmallWindowHeight = SmallScreenHeight/1.6;
            SecondSmallWindowHeight = SmallWindowHeight*1.3;
            XSScreenHeight = ScreenHeight * 0.13;
            XSSH = XSScreenHeight;
            XSHalfScreenSize = SmallWindowHeight*1.8;
            HalfScreenHeight = ScreenHeight * 0.8;
            SpecTestScreenHeight = ScreenHeight * .8;
            AppBarSize = MediaQuery.of(context).size.height/12;
                 TeacherPageHeight = ScreenHeight * .8;

        }
    else if(ShortestLength < 365 && ShortestLength > 350)
    {
         ScreenHeight = MediaQuery.of(context).size.height*1.07;
         SecondScreenHeight = ScreenHeight;
         SmallButtonWidth = MediaQuery.of(context).size.width/1.8;
         SmallScreenHeight = ScreenHeight * 0.6;
         SmallWindowHeight = SmallScreenHeight/2.1;
         SecondSmallWindowHeight = SmallWindowHeight;
         XSScreenHeight = ScreenHeight * 0.13;
         XSSH = XSScreenHeight;
         XSHalfScreenSize = SmallWindowHeight*1.25;
         HalfScreenHeight = ScreenHeight * 0.65;
         SpecTestScreenHeight = ScreenHeight * 0.65;
         AppBarSize = MediaQuery.of(context).size.height/12;
              TeacherPageHeight = ScreenHeight * 0.60;
    }
    else if(ShortestLength < 350 && LongestLength < 500)
    {
        ScreenHeight = (MediaQuery.of(context).size.height)*1.3;
        SecondScreenHeight = (MediaQuery.of(context).size.height)*1.2;
        ButtonWidth = MediaQuery.of(context).size.width/1.45;
        SmallScreenHeight = ScreenHeight * 0.64;
        SmallWindowHeight = SmallScreenHeight/1.6;
        SecondSmallWindowHeight = SmallScreenHeight/3.4;
        XSScreenHeight = ScreenHeight * 0.13;
        XSSH = (ScreenHeight * 0.13)/1.7;
        XSHalfScreenSize = (SmallWindowHeight*1.25)/1.3;
        HalfScreenHeight = ScreenHeight * 0.5;
        SpecTestScreenHeight = ScreenHeight * 0.52;
        SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
        AppBarSize = MediaQuery.of(context).size.height/10;
        TextFieldFontSize = safeBlockHorizontal*5;
             TeacherPageHeight = ScreenHeight * 0.52;
    }
     else if(ShortestLength < 350)
     {
          SmallButtonWidth = MediaQuery.of(context).size.width/1.8;
          ScreenHeight = (MediaQuery.of(context).size.height)*1.1;
          SecondScreenHeight = ScreenHeight;
          SmallScreenHeight = ScreenHeight * 0.7;
          SmallWindowHeight = SmallScreenHeight/1.6;
          SecondSmallWindowHeight = SmallScreenHeight/2.1;
          XSScreenHeight = ScreenHeight * 0.13;
          XSHalfScreenSize = (SmallWindowHeight*1.25)/1;
          HalfScreenHeight = (MediaQuery.of(context).size.height) * 0.75;
          SpecTestScreenHeight = (MediaQuery.of(context).size.height) * 0.75;
          SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
          AppBarSize = MediaQuery.of(context).size.height/10;
          TextFieldFontSize = safeBlockHorizontal*5;
               TeacherPageHeight = ScreenHeight * 0.6;
               AppbarFontSize = 22;
    }
      else if(LongestLength > 1500)
        {
              ButtonWidth = MediaQuery.of(context).size.width/2;
              ButtonTextSize = safeBlockHorizontal * 6;
              AppbarFontSize = SizeConfig.safeBlockHorizontal * 5;
              LargeButtonTextSize = 80;
              SmallIconSize = 40;
              SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
              ScreenHeight = MediaQuery.of(context).size.height*.85;
              SecondScreenHeight = ScreenHeight;
              SmallScreenHeight = ScreenHeight;
              SmallWindowHeight = SmallScreenHeight/2.1;
              SecondSmallWindowHeight = SmallWindowHeight*1.64;
              XSScreenHeight = ScreenHeight * 0.13;
              XSSH = XSScreenHeight;
              XSHalfScreenSize = SmallWindowHeight*1.75;
              HalfScreenHeight = ScreenHeight*0.78;
              SpecTestScreenHeight = ScreenHeight;
              AppBarSize = MediaQuery.of(context).size.height/18;
              TextFieldFontSize = safeBlockHorizontal*3;
                   TeacherPageHeight = ScreenHeight;

        }
    else if(LongestLength > 1000)
    {
          ButtonWidth = MediaQuery.of(context).size.width/2;
          ButtonTextSize = safeBlockHorizontal * 6;
          AppbarFontSize = SizeConfig.safeBlockHorizontal * 5;
          LargeButtonTextSize = 80;
          SmallIconSize = 40;
          SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
          ScreenHeight = MediaQuery.of(context).size.height*.85;
          SecondScreenHeight = ScreenHeight;
          SmallScreenHeight = ScreenHeight;
          SmallWindowHeight = SmallScreenHeight/2.1;
          SecondSmallWindowHeight = SmallWindowHeight*1.48;
          XSScreenHeight = ScreenHeight * 0.13;
          XSSH = XSScreenHeight;
          XSHalfScreenSize = SmallWindowHeight*1.68;
          HalfScreenHeight = ScreenHeight*.95;
          SpecTestScreenHeight = ScreenHeight*.95;
          AppBarSize = MediaQuery.of(context).size.height/18;
          TextFieldFontSize = safeBlockHorizontal*3;
               TeacherPageHeight = ScreenHeight *.95;

    }
     else if(LongestLength > 800)
        {
              ButtonWidth = MediaQuery.of(context).size.width/1.9;
              ButtonTextSize = safeBlockHorizontal * 6;
              AppbarFontSize = SizeConfig.safeBlockHorizontal * 5;
              LargeButtonTextSize = 80;
              SmallIconSize = 40;
              SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
              ScreenHeight = MediaQuery.of(context).size.height*.85;
              SecondScreenHeight = ScreenHeight;
              SmallScreenHeight = ScreenHeight;
              SmallWindowHeight = SmallScreenHeight/2.1;
              SecondSmallWindowHeight = SmallWindowHeight*1.45;
              XSScreenHeight = ScreenHeight * 0.13;
              XSSH = XSScreenHeight*0.9;
              XSHalfScreenSize = SmallWindowHeight*1.68;
              HalfScreenHeight = ScreenHeight*.95;
              SpecTestScreenHeight = ScreenHeight*.95;
              AppBarSize = MediaQuery.of(context).size.height/18;
              TextFieldFontSize = safeBlockHorizontal*3;
                   TeacherPageHeight = ScreenHeight *.95;

        }
    else
    {
          ButtonWidth = MediaQuery.of(context).size.width/1.9;
          ButtonTextSize = safeBlockHorizontal * 6;
          AppbarFontSize = SizeConfig.safeBlockHorizontal * 5;
          LargeButtonTextSize = 80;
          SmallIconSize = 40;
          SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
          ScreenHeight = MediaQuery.of(context).size.height;
          SecondScreenHeight = ScreenHeight;
          SmallScreenHeight = ScreenHeight;
          SmallWindowHeight = SmallScreenHeight/2.1;
          SecondSmallWindowHeight = SmallScreenHeight;
          XSScreenHeight = ScreenHeight * 0.13;
          XSSH = XSScreenHeight;
          XSHalfScreenSize = SmallWindowHeight*1.25;
          HalfScreenHeight = ScreenHeight*0.55;
          SpecTestScreenHeight = ScreenHeight * 0.80;
          AppBarSize = MediaQuery.of(context).size.height/18;
          TextFieldFontSize = safeBlockHorizontal*3;
               TeacherPageHeight = ScreenHeight * 0.80;
    }
  }
}