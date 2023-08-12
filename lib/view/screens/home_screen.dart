part of '../../utils/import-pass/import_pass.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.email});
  final String email;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];
  // String? email;
  // getCachedEmail() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   email = prefs.getString('email') ?? 'null';
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getCachedEmail();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Articles'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: 'videos'),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
