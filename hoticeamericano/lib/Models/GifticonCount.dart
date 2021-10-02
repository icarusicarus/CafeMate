class GifticonCount {
  int? id, userId, gifticon_4000, gifticon_6000, gifticon_8000, gifticon_10000;

  GifticonCount({
    this.id, this.userId, this.gifticon_4000, this.gifticon_6000, this.gifticon_8000, this.gifticon_10000
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'gifticon_4000': gifticon_4000,
      'gifticon_6000': gifticon_6000,
      'gifticon_8000': gifticon_8000,
      'gifticon_10000': gifticon_10000
    };
  }
}