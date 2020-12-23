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


    if(ShortestLength < 400 && LongestLength > 650 && ShortestLength < 650)
    {
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
        ScreenHeight = MediaQuery.of(context).size.height*0.93;
        SmallScreenHeight = ScreenHeight * 0.8;
        Createquestionbutton = safeBlockHorizontal * 5;
    }
    else if(ShortestLength < 650 && ShortestLength > 350)
    {
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
          ScreenHeight = MediaQuery.of(context).size.height*1.22;
          SmallScreenHeight = ScreenHeight * 0.6;
          Createquestionbutton = safeBlockHorizontal * 5;
    }
    else if(ShortestLength < 350)
    {
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
          SmallButtonWidth = MediaQuery.of(context).size.width/1.8;
          ScreenHeight = MediaQuery.of(context).size.height*1.6;
          SmallScreenHeight = ScreenHeight * 0.6;
          Createquestionbutton = safeBlockHorizontal * 5;
    }
    else
    {
      TextFontSize = safeBlockHorizontal*6;
      TextFieldFontSize = safeBlockHorizontal*5;
      ButtonWidth = MediaQuery.of(context).size.width/2;
      ButtonHeight = MediaQuery.of(context).size.height/9;
      ButtonTextSize = safeBlockHorizontal * 6;
      AppbarFontSize = SizeConfig.safeBlockHorizontal * 5;
      LargeButtonTextSize = 80;
      SquareButton = MediaQuery.of(context).size.width/4.0;
      HeaderTextFontSize = safeBlockHorizontal*5.5;
      SmallTextFontSize = safeBlockHorizontal*5;
      SmallIconSize = 80;
      MiniTextFontSize = safeBlockHorizontal*4.5;
      XSMiniTextFontSize = safeBlockHorizontal*4;
      SmallButtonWidth = MediaQuery.of(context).size.width/2.3;
      ScreenHeight = MediaQuery.of(context).size.height*0.9;
      SmallScreenHeight = ScreenHeight;
      Createquestionbutton = safeBlockHorizontal * 5;
    }
  }
}