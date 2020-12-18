import 'package:flutter/widgets.dart';

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
  static double ButtonHeight;
  static double ButtonTextSize;
  static double AppbarFontSize;
  static double LargeButtonTextSize;
  static double SquareButton;

  double ShortestLength;


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
            ShortestLength = screenWidth;
        else
            ShortestLength = screenHeight;


         print(screenWidth);
         print(screenHeight);
         if(ShortestLength < 650)
         {
            TextFontSize = safeBlockHorizontal*6;
            TextFieldFontSize = safeBlockHorizontal*5;
            ButtonWidth = MediaQuery.of(context).size.width/1.5;
            ButtonHeight = MediaQuery.of(context).size.height/9;
            ButtonTextSize = safeBlockHorizontal * 7;
            AppbarFontSize = SizeConfig.safeBlockHorizontal * 8;
            LargeButtonTextSize = 50;
            SquareButton = MediaQuery.of(context).size.width/4.0;
         }
         else
         {
              print(screenWidth);
              print(screenHeight);

         }
  }
}