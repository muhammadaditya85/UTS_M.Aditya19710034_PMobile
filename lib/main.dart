import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: 'Your title',
    home: MyApp(),
  ));
}

class User {
  final String username;
  final String email;
  final String urlAvatar;

  const User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool IsHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage('assets/icon.png'),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text('WELCOME',
                      style: GoogleFonts.montserrat(
                          color: Colors.teal.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SILAHKAN LOGIN',
                    style: TextStyle(
                        fontFamily: 'sanspro',
                        color: Colors.teal.shade100,
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 20.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.teal.shade100,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Email',
                                hintText: 'Enter Email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String Value) {},
                              validator: (Value) {
                                return Value!.isEmpty
                                    ? 'Please Enter Email'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              obscureText: IsHiddenPassword,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Password',
                                suffixIcon: InkWell(
                                  onTap: _togglepasswordView,
                                  child: Icon(Icons.visibility),
                                ),
                                hintText: 'Enter Password',
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String Value) {},
                              validator: (Value) {
                                return Value!.isEmpty
                                    ? 'Please Enter Password'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.white,
                              textColor: Colors.teal,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  void _togglepasswordView() {
    // if (IsHiddenPassword = true) {
    // IsHiddenPassword = false;
    //} else {
    //IsHiddenPassword = true;
    // }
    setState(() {
      IsHiddenPassword = !IsHiddenPassword;
    });
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<User> users = [
    const User(
        username: 'Alvina Dewi',
        email: 'alvinadewi123@gmail.com',
        urlAvatar:
            'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    const User(
        username: 'Muhammad Aditya',
        email: 'muhamamdaditya123@gmail.com',
        urlAvatar:
            'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1600'),
    const User(
        username: 'Abdul Muis',
        email: 'abdulmuis123@gmail.com',
        urlAvatar:
            'https://images.pexels.com/photos/32976/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1600'),
    const User(
        username: 'Noorani',
        email: 'noorani123@gmail.com',
        urlAvatar:
            'https://images.pexels.com/photos/9881821/pexels-photo-9881821.jpeg?auto=compress&cs=tinysrgb&w=1600'),
    const User(
        username: 'Sandi Arifani',
        email: 'sandiarifani123@gmail.com',
        urlAvatar:
            'https://images.pexels.com/photos/716411/pexels-photo-716411.jpeg?auto=compress&cs=tinysrgb&w=1600'),
    const User(
        username: 'M. Nooreza',
        email: 'rezaababil123@gmail.com',
        urlAvatar:
            'https://images.pexels.com/photos/1288182/pexels-photo-1288182.jpeg?auto=compress&cs=tinysrgb&w=1600'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Daftar Kontak',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final User = users[index];

            return Card(
              child: ListTile(
                tileColor: Color.fromARGB(255, 219, 219, 219),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(User.urlAvatar),
                ),
                title: Text(User.username, style: GoogleFonts.montserrat()),
                subtitle: Text(
                  User.email,
                  style: GoogleFonts.montserrat(),
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserPage(user: User)));
                },
              ),
            );
          },
        ),
      );
}

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(user.username, style: GoogleFonts.montserrat()),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.network(
                user.urlAvatar,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                user.username,
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(user.email, style: GoogleFonts.montserrat(fontSize: 20))
            ],
          ),
        ),
      );
}
