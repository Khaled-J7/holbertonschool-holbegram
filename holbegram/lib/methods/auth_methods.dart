import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'
    as auth; // Use an alias for FirebaseAuth
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holbegram/models/user.dart';

class AuthMethods {
  // Get instances of Firebase services
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Signs up a user with email, password, and username.
  /// Also creates a user document in Firestore.
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file, // For profile picture, will be used later
  }) async {
    String res = "Some error occurred"; // Default response message
    try {
      // Check if any of the required fields are empty
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // Register user with Firebase Authentication
        auth.UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Create a new user object using our User model
        User user = User(
          uid: cred.user!.uid,
          email: email,
          username: username,
          bio: '', // Default empty bio
          photoUrl: '', // Default empty photoUrl, will be updated later
          followers: [], // Default empty list
          following: [], // Default empty list
          posts: [], // Default empty list
          saved: [], // Default empty list
          searchKey: username[0]
              .toUpperCase(), // For search functionality later
        );

        // Add the new user to our Firestore database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "Please fill all the fields";
      }
    } catch (err) {
      // Catch and return any errors
      res = err.toString();
    }
    return res;
  }

  /// Logs in a user with email and password.
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // Sign in user with Firebase Authentication
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please fill all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
