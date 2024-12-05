class Games{
  final String amiiboseries;
  final String character;
  final String gameseries;
  final int head;
  final String image;
  final String name;
  final DateTime release;

  Games ({
  required this.amiiboseries,
  required this.character,
  required this.gameseries,
  required this.head,
  required this.image,
  required this.name,
  required this.release,
  });

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
      amiiboseries: json['amiiboseries'],
      character: json['character'],
      gameseries: json['gameseries'],
      head: json['head'],
      image:(json['image']),
      name: json['name'],
      release: json['release'],
    );
  }
}
