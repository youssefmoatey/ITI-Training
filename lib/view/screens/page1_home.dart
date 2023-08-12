part of '../../utils/import-pass/import_pass.dart';


class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String email = "";

  getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')  ?? 'null';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCachedEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Page 1 \n $email"),
    );
  }
}
