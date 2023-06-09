
class Assets {
  Assets._();

  static final fonts = _AssetsFonts._();
  static final icons = _AssetsIcons._();
  static final images = _AssetsImages._();

}

class _AssetsFonts {
  _AssetsFonts._();

  final openSans = _AssetsFontsOpenSans._();

}

class _AssetsFontsOpenSans {
  _AssetsFontsOpenSans._();


  final openSansBoldTTF = 'assets/fonts/open_sans/OpenSans-Bold.ttf';
  final openSansLightItalicTTF = 'assets/fonts/open_sans/OpenSans-LightItalic.ttf';
  final openSansRegularTTF = 'assets/fonts/open_sans/OpenSans-Regular.ttf';
}

class _AssetsIcons {
  _AssetsIcons._();


  final icCheckMarkSVG = 'assets/icons/ic_check_mark.svg';
}

class _AssetsImages {
  _AssetsImages._();


  final imAppLogoPNG = 'assets/images/im_app_logo.png';
}
