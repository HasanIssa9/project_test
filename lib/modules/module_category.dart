class Category {
  final String name;
  final String image;
  final String  desc;

  Category({
    required this.name,
    required this.image,
    required this.desc,
  });

  static List<Category> categories = [
    Category(
      name: 'فواكه',
      image:
          'https://images.unsplash.com/photo-1570457005402-8ca36f5d411e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTI4NzN8MHwxfGFsbHwxODgzMjJ8fHx8fHwyfHwxNjYwODEyNDk2&ixlib=rb-1.2.1&q=80&w=400',
      desc: "anything"
    ),
    Category(
      name: 'خضروات',
      image:
          'http://image.shutterstock.com/display_pic_with_logo/101466/112976938/stock-photo-fruits-and-vegetables-at-a-farmers-market-112976938.jpg',
          desc: "anything"
    ),
    Category(
      name: 'لحوم',
      image:
          'https://image.shutterstock.com/display_pic_with_logo/1860644/303007805/stock-photo-meat-freshness-butcher-s-shop-303007805.jpghttps://image.shutterstock.com/display_pic_with_logo/1860644/303007805/stock-photo-meat-freshness-butcher-s-shop-303007805.jpg',
          desc: "anything"
    ),
  ];
}
