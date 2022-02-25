class FlapKap {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? registered;

  FlapKap(
      {this.id,
      this.isActive,
      this.price,
      this.company,
      this.picture,
      this.buyer,
      this.tags,
      this.status,
      this.registered});

  FlapKap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['price'] = this.price;
    data['company'] = this.company;
    data['picture'] = this.picture;
    data['buyer'] = this.buyer;
    data['tags'] = this.tags;
    data['status'] = this.status;
    data['registered'] = this.registered;
    return data;
  }
}