import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  // User properties as defined in the requirements
  final String uid;
  final String email;
  final String username;
  final String bio;
  final String photoUrl;
  final List followers;
  final List following;
  final List posts;
  final List saved;
  final String searchKey;

  // Constructor to initialize the user properties
  const User({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
    required this.posts,
    required this.saved,
    required this.searchKey,
  });

  /// This method converts our User object into a Map format that
  /// can be easily stored in Firebase.
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'username': username,
    'bio': bio,
    'photoUrl': photoUrl,
    'followers': followers,
    'following': following,
    'posts': posts,
    'saved': saved,
    'searchKey': searchKey,
  };

  /// This static method takes a DocumentSnapshot from Firebase
  /// and converts it into a User object.
   static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      // Using 'as' for type safety
      uid: snapshot['uid'] as String,
      email: snapshot['email'] as String,
      username: snapshot['username'] as String,
      bio: snapshot['bio'] as String,
      photoUrl: snapshot['photoUrl'] as String,
      followers: snapshot['followers'] as List,
      following: snapshot['following'] as List,
      posts: snapshot['posts'] as List,
      saved: snapshot['saved'] as List,
      searchKey: snapshot['searchKey'] as String,
    );
  }
}
