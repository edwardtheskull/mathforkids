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


    print(screenWidth);
    print(screenHeight);

    TextFontSize = safeBlockHorizontal*6;
    TextFieldFontSize = safeBlockHorizontal*5;
    ButtonWidth = MediaQuery.of(context).size.width/1.5;
    ButtonHeight = MediaQuery.of(context).size.height/9;
    ButtonTextSize = safeBlockHorizontal * 7;
    AppbarFontSize = SizeConfig.safeBlockHorizontal * 8;
    LargeButtonTextSize = 50;
    SquareButton = MediaQuery.of(context).size.width/4.0;
    HeaderTextFontSize = safeBlockHorizontal*5.5;
    SmallTextFontSize = safeBlockHorizontal*5;
    SmallIconSize = 40;
    MiniTextFontSize = safeBlockHorizontal*4.5;
    XSMiniTextFontSize = safeBlockHorizontal*4;
    SmallButtonWidth = MediaQuery.of(context).size.width/2.2;
    Createquestionbutton = safeBlockHorizontal * 5;


    if(ShortestLength < 400 && LongestLength > 650 && ShortestLength < 650)
    {
        ScreenHeight = MediaQuery.of(context).size.height*0.93;
        SmallScreenHeight = ScreenHeight * 0.8;
        SmallIconSize = 25;
         XSScreenHeight = ScreenHeight * 0.13;
         HalfScreenHeight = ScreenHeight * 0.62;
         SpecTestScreenHeight = ScreenHeight * 0.83;

            AppBarSize = MediaQuery.of(context).size.height/12;
               TextFieldFontSize = safeBlockHorizontal*4;

    }
    else if(ShortestLength < 650 && ShortestLength > 365)
    {
          ScreenHeight = MediaQuery.of(context).size.height*1.22;
          SmallScreenHeight = ScreenHeight * 0.6;
            SmallIconSize = 25;
          XSScreenHeight = ScreenHeight * 0.13;
          HalfScreenHeight = ScreenHeight * 0.4;
          SpecTestScreenHeight = ScreenHeight * 0.60;

             AppBarSize = MediaQuery.of(context).size.height/12;
                TextFieldFontSize = safeBlockHorizontal*4;
    }
    else if(ShortestLength < 365 && ShortestLength > 350)
    {
           ScreenHeight = MediaQuery.of(context).size.height*1.07;
                  SmallScreenHeight = ScreenHeight * 0.6;
                    SmallIconSize = 25;
                  XSScreenHeight = ScreenHeight * 0.13;
                  HalfScreenHeight = ScreenHeight * 0.4;
                  SpecTestScreenHeight = ScreenHeight * 0.60;

                     AppBarSize = MediaQuery.of(context).size.height/12;
                        TextFieldFontSize = safeBlockHorizontal*4;
    }
    else if(ShortestLength < 350)
    {
          SmallButtonWidth = MediaQuery.of(context).size.width/1.8;
          ScreenHeight = (MediaQuery.of(context).size.height);
          SmallScreenHeight = ScreenHeight * 0.6;
            SmallIconSize = 25;
           XSScreenHeight = ScreenHeight * 0.13;
           HalfScreenHeight = ScreenHeight * 0.5;
           SpecTestScreenHeight = ScreenHeight * 0.70;
            SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
              AppBarSize = MediaQuery.of(context).size.height/14;
    }
    else if(LongestLength > 1000)
    {
      ButtonWidth = MediaQuery.of(context).size.width/2;
      ButtonTextSize = safeBlockHorizontal * 6;
      AppbarFontSize = SizeConfig.safeBlockHorizontal * 5;
      LargeButtonTextSize = 80;
      SmallIconSize = 60;
      SmallButtonWidth = MediaQuery.of(context).size.width/2.5;
      ScreenHeight = MediaQuery.of(context).size.height*0.73;
      SmallScreenHeight = ScreenHeight;

       XSScreenHeight = ScreenHeight * 0.13;
       HalfScreenHeight = ScreenHeight*0.55;
        SpecTestScreenHeight = ScreenHeight * 0.80;

       AppBarSize = MediaQuery.of(context).size.height/18;
           TextFieldFontSize = safeBlockHorizontal*3;

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
              SmallScreenHeight = ScreenHeight;

               XSScreenHeight = ScreenHeight * 0.13;
               HalfScreenHeight = ScreenHeight*0.55;
                SpecTestScreenHeight = ScreenHeight * 0.80;

                AppBarSize = MediaQuery.of(context).size.height/18;
                TextFieldFontSize = safeBlockHorizontal*3;
    }
  }
}