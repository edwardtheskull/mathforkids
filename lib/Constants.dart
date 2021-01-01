class Constants{
  static const String ChangeTheme = 'Change theme';
  static const String Logout = 'Logout';
  static const String Login = 'Login';
  static const String Register = 'Register';


  static const List<String> choices = <String>[
    ChangeTheme,
    Logout
  ];

  static const List<String> Outlogged = <String>[
    ChangeTheme
  ];

  static const List<String> signinOnReg = <String>[
    ChangeTheme,
    Login
  ];

  static const List<String> regOnSignin = <String>[
    ChangeTheme,
    Register
  ];
}