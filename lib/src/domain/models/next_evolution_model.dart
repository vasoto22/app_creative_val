class NextEvolution {
  late String num;
  late String name;

  NextEvolution({
    required this.num,
    required this.name,
  });

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['name'] = name;
    return data;
  }
}
