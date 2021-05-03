import 'dart:convert';

class CatPhoto {
  final String id;
  final String url;
  final int width;
  final int height;

  const CatPhoto({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory CatPhoto.fromMap(Map<String, dynamic> map) {
    return CatPhoto(
      id: map['id'],
      url: map['url'],
      width: map['width'],
      height: map['height'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CatPhoto.fromJson(String source) =>
      CatPhoto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CatPhoto(id: $id, url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CatPhoto &&
        other.id == id &&
        other.url == url &&
        other.width == width &&
        other.height == height;
  }

  @override
  int get hashCode {
    return id.hashCode ^ url.hashCode ^ width.hashCode ^ height.hashCode;
  }
}
