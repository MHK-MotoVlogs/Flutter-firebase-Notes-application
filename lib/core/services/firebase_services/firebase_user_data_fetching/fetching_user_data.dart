import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notepad/core/models/user_details_model/user_info/user_info.dart';
import 'package:notepad/core/services/firebase_services/current_user_credentials/current_user.dart';

fetchingUserData() async {
  /// FirebaseFirestore instance

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  /// Exception handling for fetching user data

  try {
    DocumentSnapshot documentSnapshot = await firebaseFirestore
        .collection("Notes")

        ///CurrentUser class used to fetch uid

        .doc(CurrentUser.currentUser().uid.toString())
        .get();

    /// after success returning data
    if (documentSnapshot.data() != null) {
      /// converting document snap shot data into map

      Map<String, dynamic> map =
          documentSnapshot.data() as Map<String, dynamic>;

      /// creating and returning UserInfo objec

      return UserInfo(email: map["email"], name: map["name"], uid: map["uid"]);
    }
    ;
  }

  /// catching error

  catch (error) {
    print(error.toString());
  }
}
