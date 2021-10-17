import 'dart:convert';
import 'dart:io';

typedef Data = Map<String, String>;
typedef OneStore = List<Data>;
typedef AllStore = Map<String, OneStore>;

const String mockedNYTimesId = 'W9iqEiWfTOx';

String image(String name) => base64Encode(
      File('./assets/$name').readAsBytesSync(),
    );

final OneStore mockedArticles = <Data>[
  <String, String>{
    'title': 'Higher Rents Burden Tenants, Fuel Inflation and Trouble the Fed',
    'content':
        '''Rents are shooting high after a pandemic slump, hurting pocketbooks and distressing voters.
The issue stems from a market frenzy for owned homes.

Economic policymakers have said inflation will prove temporary.
The rent rise may challenge that view and pressure Washington and the Federal Reserve.''',
    'id': 'RYzwRUXOxHa',
    'author': mockedNYTimesId,
    'thumbnail': image('worker.jpg'),
  },
  <String, String>{
    'title':
        "Cybersole's interface as Mr. Titus uses the software to purchase sweatshirts from Kith.",
    'content':
        '''A bot alone is no guarantee of success. Many prominent botters run multiple types of bots for major releases, because each one has different strengths and weaknesses. Some botters rent dozens of computer servers in the same facilities as the retailers to save milliseconds on data latency.
Mr. Titus said he understands the frustration some sneaker buyers may feel about bots. But as he sees it, he is merely providing tools that people want. That includes retailers who have seen bots generate demand for their products.

"While they have to act like they're trying to stop bots, it's making them a huge profit," he said.
He has developed a friendly rivalry with Mr. Lemieux. When Mr. Titus showed off a new Tesla, Mr. Lemieux suggested that he decorate the car with some Shopify decals.
Mr. Lemieux said Mr. Titus "is a very, very good programmer" and that he would try to hire him for Shopify if he were willing to cross over to the other side.

"I've had some nice interactions with him," Mr. Titus said. "Obviously we can't disclose too much of what either of us are doing because it's kind of a cat-and-mouse game between Shopify and us."
Ahead of a special release, the New Balance 990v3 to celebrate Bodega's 15th anniversary, the boutique and Shopify had devised a few obstacles to slow the bots down. The first was to place the product on a brand-new website with an unguessable address — analogwebsitewrittenonpaper.com.
Right away, botters saw this as a deterrent.

"We may have to go manual," said Trevor Roskovensky, a sneaker buyer, in a YouTube video of him trying to buy the shoe live.
Bodega also added a question that shoppers had to type out the answer: What are the last four letters of the alphabet? After that, shoppers had to complete a challenge of drawing boxes around airplanes.
''',
    'id': 'q9EWiitEhZK',
    'author': mockedNYTimesId,
    'thumbnail': image('snickers.png'),
  },
  <String, String>{
    'title':
        'Have an F.S.A.? You May Be Able to Carry Over More Money in 2022.',
    'content':
        '''Do you have a flexible health spending account through your job? Rules for the accounts have changed temporarily because of the pandemic, and that may affect how much you'll want to save next year.

Flexible health spending accounts, or F.S.A.s, let employees set aside pretax money from their paychecks to help pay for medical and dental care that insurance doesn't cover.

In many cases, if you don't spend the money by a certain deadline — often the end of the calendar year — you forfeit the cash in your account.
“They are typically 'use it or lose it,'" said Lisa Myers, director of client services with the benefits consultant Willis Towers Watson.

Employers already had the option of offering wiggle room, like allowing workers to carry some of the money in their accounts into the new year or giving grace periods of a couple of months after the deadline for spending the money. About three-fourths of accounts offered one of those options in 2019, according to the nonpartisan and nonprofit Employee Benefit Research Institute.''',
    'id': '2PBE28hfAda',
    'author': mockedNYTimesId,
    'thumbnail': image('money.png'),
  },
];

final OneStore mockedUsers = <Data>[
  <String, String>{
    'name': 'New York Times',
    'email': 'publisher@nytimes.com',
    'password': '5up3R-51cR3T-pA55W0RD',
    'id': mockedNYTimesId,
    'picture': image('nytimes.png'),
  },
];

final AllStore mockedStores = <String, OneStore>{
  'articles': mockedArticles,
  'users': mockedUsers,
};
