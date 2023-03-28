import 'package:flutter/foundation.dart';
import 'package:radditz/src/common/common.dart';

@immutable
class Post {
  const Post({
    required this.id,
    required this.text,
    required this.hashtags,
    required this.link,
    required this.imageLinks,
    required this.uid,
    required this.postType,
    required this.postedAt,
    required this.likes,
    required this.commentIds,
    required this.reshareCount,
    required this.repostedBy,
    required this.repliedTo,
  });

  factory Post.fromMap(Map<String, dynamic> map) => Post(
        id: map[r'$id'] as String,
        text: map['text'] as String,
        hashtags: List<String>.from(map['hashtags'] as List<dynamic>),
        link: map['link'] as String,
        imageLinks: List<String>.from(map['imageLinks'] as List<dynamic>),
        uid: map['uid'] as String,
        postType: (map['postType'] as String).toPostTypeEnum(),
        postedAt: DateTime.fromMillisecondsSinceEpoch(map['postedAt'] as int),
        likes: List<String>.from(map['likes'] as List<dynamic>),
        commentIds: List<String>.from(map['commentIds'] as List<dynamic>),
        reshareCount: map['reshareCount']?.toInt() as int,
        repostedBy: map['repostedBy'] as String,
        repliedTo: map['repliedTo'] as String,
      );

  final String id;
  final String text;
  final List<String> hashtags;
  final String link;
  final List<String> imageLinks;
  final String uid;
  final PostType postType;
  final DateTime postedAt;
  final List<String> likes;
  final List<String> commentIds;
  final int reshareCount;
  final String repostedBy;
  final String repliedTo;

  Post copyWith({
    String? text,
    List<String>? hashtags,
    String? link,
    List<String>? imageLinks,
    String? uid,
    PostType? postType,
    DateTime? postedAt,
    List<String>? likes,
    List<String>? commentIds,
    String? id,
    int? reshareCount,
    String? repostedBy,
    String? repliedTo,
  }) {
    return Post(
      text: text ?? this.text,
      hashtags: hashtags ?? this.hashtags,
      link: link ?? this.link,
      imageLinks: imageLinks ?? this.imageLinks,
      uid: uid ?? this.uid,
      postType: postType ?? this.postType,
      postedAt: postedAt ?? this.postedAt,
      likes: likes ?? this.likes,
      commentIds: commentIds ?? this.commentIds,
      id: id ?? this.id,
      reshareCount: reshareCount ?? this.reshareCount,
      repostedBy: repostedBy ?? this.repostedBy,
      repliedTo: repliedTo ?? this.repliedTo,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result.addAll(<String, dynamic>{'text': text});
    result.addAll(<String, dynamic>{'hashtags': hashtags});
    result.addAll(<String, dynamic>{'link': link});
    result.addAll(<String, dynamic>{'imageLinks': imageLinks});
    result.addAll(<String, dynamic>{'uid': uid});
    result.addAll(<String, dynamic>{'postType': postType.toString()});
    result.addAll(<String, dynamic>{
      'postedAt': postedAt.millisecondsSinceEpoch,
    });
    result.addAll(<String, dynamic>{'likes': likes});
    result.addAll(<String, dynamic>{'commentIds': commentIds});
    result.addAll(<String, dynamic>{'reshareCount': reshareCount});
    result.addAll(<String, dynamic>{'repostedBy': repostedBy});
    result.addAll(<String, dynamic>{'repliedTo': repliedTo});

    return result;
  }

  @override
  String toString() {
    return 'Post(text: $text, hashtags: $hashtags, link: $link, imageLinks: $imageLinks, uid: $uid, postType: $postType, postedAt: $postedAt, likes: $likes, commentIds: $commentIds, id: $id, reshareCount: $reshareCount, repostedBy: $repostedBy, repliedTo: $repliedTo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Post &&
        other.text == text &&
        listEquals(other.hashtags, hashtags) &&
        other.link == link &&
        listEquals(other.imageLinks, imageLinks) &&
        other.uid == uid &&
        other.postType == postType &&
        other.postedAt == postedAt &&
        listEquals(other.likes, likes) &&
        listEquals(other.commentIds, commentIds) &&
        other.id == id &&
        other.reshareCount == reshareCount &&
        other.repostedBy == repostedBy &&
        other.repliedTo == repliedTo;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      text.hashCode ^
      hashtags.hashCode ^
      link.hashCode ^
      imageLinks.hashCode ^
      uid.hashCode ^
      postType.hashCode ^
      postedAt.hashCode ^
      likes.hashCode ^
      commentIds.hashCode ^
      reshareCount.hashCode ^
      repostedBy.hashCode ^
      repliedTo.hashCode;
}
