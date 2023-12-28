class ImageData {
  String imageUrl;
  String tags;

//<editor-fold desc="Data Methods">
  ImageData({
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageData &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageData{ imageUrl: $imageUrl, tags: $tags,}';
  }

  ImageData copyWith({
    String? imageUrl,
    String? tags,
  }) {
    return ImageData(
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'tags': tags,
    };
  }

  factory ImageData.fromMap(Map<String, dynamic> map) {
    return ImageData(
      imageUrl: map['imageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}