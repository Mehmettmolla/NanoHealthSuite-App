
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


  final icArrowDownSVG = 'assets/icons/ic_arrow_down.svg';
  final icArrowUpSVG = 'assets/icons/ic_arrow_up.svg';
  final icBackArrowSVG = 'assets/icons/ic_back_arrow.svg';
  final icCheckMarkSVG = 'assets/icons/ic_check_mark.svg';
  final icLikeActiveSVG = 'assets/icons/ic_like_active.svg';
  final icLikePassiveSVG = 'assets/icons/ic_like_passive.svg';
  final icProductActiveSVG = 'assets/icons/ic_product_active.svg';
  final icProductPassiveSVG = 'assets/icons/ic_product_passive.svg';
  final icProfileActiveSVG = 'assets/icons/ic_profile_active.svg';
  final icProfilePassiveSVG = 'assets/icons/ic_profile_passive.svg';
  final icShareSVG = 'assets/icons/ic_share.svg';
  final icShoppingActiveSVG = 'assets/icons/ic_shopping_active.svg';
  final icShoppingPassiveSVG = 'assets/icons/ic_shopping_passive.svg';
  final icThreeDotSVG = 'assets/icons/ic_three_dot.svg';
}

class _AssetsImages {
  _AssetsImages._();


  final imAppLogoPNG = 'assets/images/im_app_logo.png';
}
