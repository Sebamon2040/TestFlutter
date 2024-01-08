class Breed {
  List<Data>? data;
  Links? links;

  Breed({this.data, this.links});

  Breed.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? type;
  Attributes? attributes;

  Data({this.id, this.type, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? description;
  bool? hypoallergenic;
  Life? life;
  MaleWeight? maleWeight;
  FemaleWeight? femaleWeight;

  Attributes({this.name, this.description, this.hypoallergenic, this.life, this.maleWeight, this.femaleWeight});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    hypoallergenic = json['hypoallergenic'];
    life = json['life'] != null ? new Life.fromJson(json['life']) : null;
    maleWeight = json['male_weight'] != null ? new MaleWeight.fromJson(json['male_weight']) : null;
    femaleWeight = json['female_weight'] != null ? new FemaleWeight.fromJson(json['female_weight']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['hypoallergenic'] = this.hypoallergenic;
    if (this.life != null) {
      data['life'] = this.life!.toJson();
    }
    if (this.maleWeight != null) {
      data['male_weight'] = this.maleWeight!.toJson();
    }
    if (this.femaleWeight != null) {
      data['female_weight'] = this.femaleWeight!.toJson();
    }
    return data;
  }
}

class Life {
  int? min;
  int? max;

  Life({this.min, this.max});

  Life.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class MaleWeight {
  int? min;
  int? max;

  MaleWeight({this.min, this.max});

  MaleWeight.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class FemaleWeight {
  int? min;
  int? max;

  FemaleWeight({this.min, this.max});

  FemaleWeight.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class Links {
  String? self;
  String? current;
  String? next;
  String? last;

  Links({this.self, this.current, this.next, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    current = json['current'];
    next = json['next'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['current'] = this.current;
    data['next'] = this.next;
    data['last'] = this.last;
    return data;
  }
}
