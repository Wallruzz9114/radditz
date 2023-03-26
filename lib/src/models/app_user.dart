import 'package:flutter/foundation.dart';

@immutable
class AppUser {
  const AppUser({
    required this.uid,
    required this.email,
    required this.username,
    required this.followers,
    required this.following,
    required this.profilePic,
    required this.bannerPic,
    required this.bio,
    required this.isVerified,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
        uid: map[r'$id'] as String,
        email: map['email'] as String,
        username: map['username'] as String,
        followers: List<String>.from(map['followers'] as List<String>),
        following: List<String>.from(map['following'] as List<String>),
        profilePic: map['profilePic'] as String,
        bannerPic: map['bannerPic'] as String,
        bio: map['bio'] as String,
        isVerified: map['isVerified'] as bool,
      );

  final String uid;
  final String email;
  final String username;
  final List<String> followers;
  final List<String> following;
  final String profilePic;
  final String bannerPic;
  final String bio;
  final bool isVerified;

  AppUser copyWith({
    String? uid,
    String? email,
    String? username,
    List<String>? followers,
    List<String>? following,
    String? profilePic,
    String? bannerPic,
    String? bio,
    bool? isVerified,
  }) =>
      AppUser(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        username: username ?? this.username,
        followers: followers ?? this.followers,
        following: following ?? this.following,
        profilePic: profilePic ?? this.profilePic,
        bannerPic: bannerPic ?? this.bannerPic,
        bio: bio ?? this.bio,
        isVerified: isVerified ?? this.isVerified,
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result.addAll(<String, dynamic>{'email': email});
    result.addAll(<String, dynamic>{'username': username});
    result.addAll(<String, dynamic>{'followers': followers});
    result.addAll(<String, dynamic>{'following': following});
    result.addAll(<String, dynamic>{'profilePic': profilePic});
    result.addAll(<String, dynamic>{'bannerPic': bannerPic});
    result.addAll(<String, dynamic>{'bio': bio});
    result.addAll(<String, dynamic>{'isVerified': isVerified});

    return result;
  }

  @override
  String toString() =>
      'AppUser(uid: $uid, email: $email, username: $username, followers: $followers, following: $following, profilePic: $profilePic, bannerPic: $bannerPic, bio: $bio, isVerified: $isVerified)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AppUser &&
        other.uid == uid &&
        other.email == email &&
        other.username == username &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.profilePic == profilePic &&
        other.bannerPic == bannerPic &&
        other.bio == bio &&
        other.isVerified == isVerified;
  }

  @override
  int get hashCode =>
      uid.hashCode ^
      email.hashCode ^
      username.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      profilePic.hashCode ^
      bannerPic.hashCode ^
      bio.hashCode ^
      isVerified.hashCode;
}
