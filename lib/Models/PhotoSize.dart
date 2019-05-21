
enum photoSize {
  xsSmall,
  xSmall,
  small,
  medium,
  large,
  xLarge,
  xxLarge,
  xxxLarge,
  xxxxlarge
}
class PhotoSize {
  static const Map<photoSize, String> sizeValue = {
    photoSize.xsSmall: '48x48',
    photoSize.xSmall: '64x64',
    photoSize.small: '96x96',
    photoSize.medium: '120x120',
    photoSize.large: '240x120',
    photoSize.xLarge: '360x360',
    photoSize.xxLarge: '432x432',
    photoSize.xxxLarge: '504x504',
    photoSize.xxxxlarge: '648x648'
  };
  String getPicSize(photoSize size){
     return sizeValue[size];
  }
}
