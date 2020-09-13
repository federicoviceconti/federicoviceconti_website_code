enum PageEnum {
  home,
  aboutMe,
  contact
}

extension PageEnumExtension on PageEnum {
  int get pageIndex => const {
    PageEnum.home: 0,
    PageEnum.aboutMe: 1,
    PageEnum.contact: 2
  }[this];
}