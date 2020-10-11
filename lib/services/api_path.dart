
class APIPath {
  //TODO: Path for writing data to firestroe:
  static String report(String uid, String reportId,) =>'users/$uid/Reports/$reportId';

  //TODO: path for reading data from firestore:
  static String reports(String uid)=> 'users/$uid/Reports';

  //TODO: path for reading news section from firestore:
  static String news(String news, String docId) => 'news/$docId';

}