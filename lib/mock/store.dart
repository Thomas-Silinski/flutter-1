typedef Data = Map<String, String>;
typedef OneStore = List<Data>;
typedef AllStore = Map<String, OneStore>;

// todo: change fake data
final OneStore mockedArticles = <Data>[
  <String, String>{
    'title': 'La famine dans le monde !',
    'content': "c'est vraiment très très triste ://",
    'id': 'RYzwRUXOxHa',
  },
  <String, String>{
    'title': 'Le covid attaque !',
    'content': 'encore ???????????????????????????,',
    'id': 'q9EWiitEhZK'
  },
  <String, String>{
    'title': 'Les talibans font pacte avec les aliens',
    'content': "on l'avait pas vu venir",
    'id': '2PBE28hfAda'
  },
];

final OneStore mockedUsers = <Data>[
  <String, String>{
    'name': 'Toto le haricot',
    'email': 'toto@haricot.mail',
    'password': '5up3R-51cR3T-pA55W0RD',
    'id': 'W9iqEiWfTOx'
  },
];

final AllStore mockedStores = <String, OneStore>{
  'articles': mockedArticles,
  'users': mockedUsers,
};
