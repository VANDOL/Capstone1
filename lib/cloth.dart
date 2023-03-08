import 'package:flutter/material.dart';

//계절별 리스트
List spH = ["cap"];
List spJ = ["cardigan", "nylon_jacket", "trench_coat", "vest"];
List spT = [
  "sleeve",
  "hoodie",
  "knitwear",
  "dress_shirts",
  "sweater",
  "turtleneck"
];
List spB = [
  "jogger_pants",
  "overall",
  "trousers",
  "training_pants",
  "pants",
  "dress_pants"
];

List suH = ["cap"];
List suT = [
  "undershirt",
  "hawaiian_shirt",
  "short_shirt",
  "polo_shirt",
  "Tshirt",
  "sleeve"
];
List suB = [
  "denim_shorts",
  "hawiian_pants",
  "training_pants",
  "slack",
  "pants",
  "dress_pants"
];

List auH = ["cap", "beanie"];
List auJ = [
  "hood_zipup",
  "nylon_jacket",
  "trench_coat",
  "coat",
  "duffle_coat",
  "vest",
];
List auT = [
  "sleeve",
  "hoodie",
  "knitwear",
  "dress_shirts",
  "sweater",
  "turtleneck"
];
List auB = ["overall", "slack", "pants", "dress_pants"];

List wiH = ["muff", "winter_scarf"];
List wiJ = ["padded_coat", "long_padded", "coat"];
List wiT = [
  "dress_shirts",
  "knitwear",
  "sleeve",
  "sweater",
  "vest",
  "turtleneck"
];
List wiB = ["jogger_pants", "training_pants", "slack"];

//기온별 리스트
List tmp23_head = ["cap"];
List tmp23_top = ["hawaiian_shirt", "undershirt", "Tshirt"];
List tmp23_bot = ["denim_shorts", "hawiian_pants"];

List tmp19_head = ["cap"];
List tmp19_top = ["polo_shirt", "short_shirt", "Tshirt"];
List tmp19_bot = ["pants", "dress_pants"];

List tmp16_out = ["nylon_jacket"];
List tmp16_top = ["hoodie", "sleeve"];
List tmp16_bot = ["trousers", "overall", "dress_pants"];

List tmp11_out = ["cardigan", "vest", "hood_zipup"];
List tmp11_top = ["hoodie", "knitwear", "sweater", "sleeve"];
List tmp11_bot = ["jogger_pants", "slack", "training_pants"];

List tmp8_out = ["trench_coat", "duffle_coat"];
List tmp8_top = ["turtleneck", "knitwear", "sweater", "sleeve"];
List tmp8_bot = ["pants", "slack", "training_pants"];

List tmp4_head = ["beanie", "muff"];
List tmp4_out = ["coat", "duffle_coat"];
List tmp4_top = ["turtleneck", "knitwear", "sweater", "sleeve"];
List tmp4_bot = ["slack", "training_pants", "dress_pants"];

List tmp0_head = ["winter_scarf", "muff"];
List tmp0_out = ["long_padded", "padded_coat", "coat"];
List tmp0_top = ["hoodie", "turtleneck", "knitwear", "sweater"];
List tmp0_bot = ["slack", "dress_pants"];

double clothes_gap = 7;
double clothes_width = 53;
double clothes_height = 53;
double font_size = 14;
//계절별
Widget spring() => Container(
    height: 370,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${spH[0]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "캡모자",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${spJ[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spJ[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 6),
          Image.asset("assets/icons/${spJ[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spJ[3]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 7,
          ),
          Text(
            "가디건",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "바람막이",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "트렌치코트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(width: 18),
          Text(
            "조끼",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${spT[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spT[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spT[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spT[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spT[4]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${spT[5]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "후드티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "니트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 26,
          ),
          Text(
            "긴팔셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 17,
          ),
          Text(
            "맨투맨",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 19,
          ),
          Text(
            "목폴라티",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${spB[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap - 5),
          Image.asset("assets/icons/${spB[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap - 4),
          Image.asset("assets/icons/${spB[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap - 2),
          Image.asset("assets/icons/${spB[5]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap - 6),
          Image.asset("assets/icons/${spB[4]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 4),
          Image.asset("assets/icons/${spB[3]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        Row(children: [
          SizedBox(
            width: 2,
          ),
          Text(
            "조거팬츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            "멜빵바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "나팔바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "면바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 17,
          ),
          Text(
            "청바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "트레이닝팬츠",
            style: TextStyle(fontSize: 13.5),
          )
        ]),
      ],
    ));

Widget summer() => Container(
    height: 370,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${suT[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 10),
          Image.asset("assets/icons/${suT[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 16),
          Image.asset("assets/icons/${suT[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 9,
          ),
          Text(
            "민소매",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(width: 14),
          Text(
            "하와이안셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(width: 16),
          Text(
            "반팔셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 4,
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          SizedBox(width: 6),
          Image.asset("assets/icons/${suT[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 10),
          Image.asset("assets/icons/${suT[4]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 10),
          Image.asset("assets/icons/${suT[5]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          Text(
            "폴로반팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "반팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 32,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${suB[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 14),
          Image.asset("assets/icons/${suB[4]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 10),
          Image.asset("assets/icons/${suB[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "슬렉스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 36,
          ),
          Text(
            "청바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "트레이닝팬츠",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${suB[5]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 10),
          Image.asset("assets/icons/${suB[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 14),
          Image.asset("assets/icons/${suB[1]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 8,
          ),
          Text(
            "면바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 32,
          ),
          Text(
            "반바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 22,
          ),
          Text(
            "하와이안바지",
            style: TextStyle(fontSize: font_size),
          ),
        ])
      ],
    ));

Widget autumn() => Container(
    height: 380,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${auH[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auH[1]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "캡모자",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 28,
          ),
          Text(
            "비니",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${auJ[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auJ[5]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auJ[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auJ[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auJ[4]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auJ[1]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 3,
          ),
          Text(
            "후드집업",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "조끼",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "트렌치코트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            "코트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "더플코트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "바람막이",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${auT[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auT[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auT[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auT[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auT[4]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 26,
          ),
          Text(
            "후드티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "니트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "긴팔셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            "맨투맨",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${auB[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auB[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auB[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${auB[3]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          Text(
            "멜빵바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 19,
          ),
          Text(
            "슬렉스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "청바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "면바지",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
      ],
    ));

Widget winter() => Container(
    height: 370,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          SizedBox(width: 26),
          Image.asset("assets/icons/${wiH[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(
            width: clothes_gap + 20,
          ),
          Image.asset("assets/icons/${wiH[0]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "털모자+목도리",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(width: 26),
          Text(
            "귀마개",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${wiJ[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${wiJ[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${wiJ[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 12,
          ),
          Text(
            "패딩",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "롱패딩",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            "겨울코트",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${wiT[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${wiT[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${wiT[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${wiT[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${wiT[5]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 3,
          ),
          Text(
            "긴팔셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "니트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 28,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "맨투맨",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 19,
          ),
          Text(
            "목폴라티",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          SizedBox(width: 4),
          Image.asset("assets/icons/${wiB[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 13),
          Image.asset("assets/icons/${wiB[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 7),
          Image.asset("assets/icons/${wiB[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "조거팬츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "트레이닝팬츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "슬렉스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 9,
          ),
        ]),
      ],
    ));

//기온별
Widget Tmp0() => Container(
    height: 360,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          SizedBox(width: 25),
          Image.asset("assets/icons/${tmp0_head[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 20),
          Image.asset("assets/icons/${tmp0_head[1]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "털모자+목도리",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "귀마개",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp0_out[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp0_out[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 10),
          Image.asset("assets/icons/${tmp0_out[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "롱패딩",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 28,
          ),
          Text(
            "패딩",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 22,
          ),
          Text(
            "코트(두꺼운)",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp0_top[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp0_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp0_top[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp0_top[3]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "후드티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "목폴라티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "니트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 29,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp0_bot[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp0_bot[1]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "슬랙스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            "면바지(두꺼운)",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 2,
          ),
        ]),
      ],
    ));

Widget Tmp4() => Container(
    height: 360,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${tmp4_head[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_head[1]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        Row(children: [
          SizedBox(
            width: 3,
          ),
          Text(
            "비니모자",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "귀마개",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp4_out[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_out[1]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 15,
          ),
          Text(
            "코트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "더플코트",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp4_top[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_top[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_top[3]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "목폴라",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "니트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 29,
          ),
          Text(
            "맨투맨",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 9,
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp4_bot[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_bot[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp4_bot[2]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "슬랙스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            "트레이닝팬츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            "면바지(두꺼운)",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 2,
          ),
        ]),
      ],
    ));

Widget Tmp8() => Container(
    height: 280,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          SizedBox(
            width: 3,
          ),
          Image.asset("assets/icons/${tmp8_out[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 6),
          Image.asset("assets/icons/${tmp8_out[1]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 0,
          ),
          Text(
            "트랜치코트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "더플코트",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp8_top[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp8_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp8_top[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp8_top[3]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 4,
          ),
          Text(
            "목폴라티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 22,
          ),
          Text(
            "니트",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "맨투맨",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp8_bot[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp8_bot[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 4),
          Image.asset("assets/icons/${tmp8_bot[2]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 8,
          ),
          Text(
            "청바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "슬랙스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "트레이닝바지",
            style: TextStyle(fontSize: font_size),
          ),
        ])
      ],
    ));

Widget Tmp11() => Container(
    height: 280,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${tmp11_out[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp11_out[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp11_out[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 9,
          ),
          Text(
            "가디건",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 28,
          ),
          Text(
            "조끼",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 26,
          ),
          Text(
            "후드집업",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp11_top[3]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp11_top[2]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp11_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp11_top[0]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 8,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "맨투맨",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "스웨터",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "후드티",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          SizedBox(
            width: 2,
          ),
          Image.asset("assets/icons/${tmp11_bot[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap - 2),
          Image.asset("assets/icons/${tmp11_bot[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp11_bot[2]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "조거팬츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "슬랙스",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "트레이닝바지",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
      ],
    ));

Widget Tmp16() => Container(
    height: 280,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${tmp16_out[0]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 2,
          ),
          Text(
            "바람막이",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp16_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 1),
          Image.asset("assets/icons/${tmp16_top[0]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 8,
          ),
          Text(
            "긴팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "후드티",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp16_bot[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 2),
          Image.asset("assets/icons/${tmp16_bot[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp16_bot[2]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 1,
          ),
          Text(
            "나팔바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "멜빵바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "면바지",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
      ],
    ));

Widget Tmp19() => Container(
    height: 280,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${tmp19_head[0]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "캡모자",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          SizedBox(width: 2),
          Image.asset("assets/icons/${tmp19_top[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 7),
          Image.asset("assets/icons/${tmp19_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 1),
          Image.asset("assets/icons/${tmp19_top[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 0,
          ),
          Text(
            "폴로반팔티",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "반팔셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "T-셔츠",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          Image.asset("assets/icons/${tmp19_bot[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp19_bot[1]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 6,
          ),
          Text(
            "청바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "면바지",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
      ],
    ));

Widget Tmp23() => Container(
    height: 280,
    decoration: BoxDecoration(color: Colors.transparent),
    child: Column(
      children: [
        Row(children: [
          Image.asset("assets/icons/${tmp23_head[0]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        Row(children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "캡모자",
            style: TextStyle(fontSize: font_size),
          )
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          SizedBox(width: 10),
          Image.asset("assets/icons/${tmp23_top[0]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 8),
          Image.asset("assets/icons/${tmp23_top[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap),
          Image.asset("assets/icons/${tmp23_top[2]}.png",
              width: clothes_width, height: clothes_height),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 0,
          ),
          Text(
            "하와이안셔츠",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 13,
          ),
          Text(
            "민소매",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            "반팔티",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [
          SizedBox(width: 10),
          Image.asset("assets/icons/${tmp23_bot[1]}.png",
              width: clothes_width, height: clothes_height),
          SizedBox(width: clothes_gap + 16),
          Image.asset("assets/icons/${tmp23_bot[0]}.png",
              width: clothes_width, height: clothes_height)
        ]),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          SizedBox(
            width: 0,
          ),
          Text(
            "하와이안바지",
            style: TextStyle(fontSize: font_size),
          ),
          SizedBox(
            width: 19,
          ),
          Text(
            "반바지",
            style: TextStyle(fontSize: font_size),
          ),
        ]),
      ],
    ));
