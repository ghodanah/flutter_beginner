class ImageItem {
  String pageUrl;
  String tags;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.pageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          pageUrl == other.pageUrl &&
          tags == other.tags);

  @override
  int get hashCode => pageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageItem{ pageUrl: $pageUrl, tags: $tags,}';
  }

  ImageItem copyWith({
    String? pageUrl,
    String? tags,
  }) {
    return ImageItem(
      pageUrl: pageUrl ?? this.pageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pageUrl': pageUrl,
      'tags': tags,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) {
    return ImageItem(
      pageUrl: map['pageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}