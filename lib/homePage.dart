import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final pages = [
    BirinchiOyna(),
    IkkinchiOyna(),
    UchinchiOyna(),
    TortinchiOyna(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        fullTransitionValue: 400,
        enableLoop: true,
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,
        pages: pages,
      ),
    );
  }
}

class BirinchiOyna extends StatefulWidget {
  const BirinchiOyna({super.key});

  @override
  State<BirinchiOyna> createState() => _BirinchiOynaState();
}

class _BirinchiOynaState extends State<BirinchiOyna> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  void _login() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login muvaffaqiyatli!'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Spacer(),
              const Text(
                'Instagram',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 56,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                _usernameController,
                'Phone number, username or email',
                false,
              ),
              const SizedBox(height: 10),
              _buildPasswordField(),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF0095F6),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 0.5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?  ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color(0xFF0095F6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    bool isPassword,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300]!, width: 0.5),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300]!, width: 0.5),
      ),
      child: TextField(
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey[600],
              size: 18,
            ),
            onPressed: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class IkkinchiOyna extends StatefulWidget {
  const IkkinchiOyna({super.key});

  @override
  State<IkkinchiOyna> createState() => _IkkinchiOynaState();
}

class _IkkinchiOynaState extends State<IkkinchiOyna> {
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'javad',
      'userImage':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW_NB41LKvS34_tvQnAN8AuJ1oN5KFBixBEQ&s',
      'postImage':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpC94PhnEh55NqL9s-EGsOPXFE3-FSK4d2og&s',
      'likes': 245,
      'caption': 'Ronaldo is going to score more goals this season!',
      'comments': 12,
      'time': '2 hours ago',
    },
    {
      'username': 'sarah',
      'userImage':
          'https://fcb-abj-pre.s3.amazonaws.com/img/jugadors/MESSI.jpg',
      'postImage':
          'https://en.reformsports.com/oxegrebi/2023/07/Differences-Between-Stadium-and-Arena.jpg',
      'likes': 892,
      'caption': 'Messi is the worst player in this year.',
      'comments': 34,
      'time': '5 hours ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post['userImage']),
                ),
                title: Text(
                  post['username'],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.more_vert),
              ),
              Image.network(
                post['postImage'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: const [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 16),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 16),
                    Icon(Icons.send_outlined),
                    Spacer(),
                    Icon(Icons.bookmark_border),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '${post['likes']} likes',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4,
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '${post['username']} ',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: post['caption']),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'View all ${post['comments']} comments',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4,
                ),
                child: Text(
                  post['time'],
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class UchinchiOyna extends StatefulWidget {
  const UchinchiOyna({super.key});

  @override
  State<UchinchiOyna> createState() => _UchinchiOynaState();
}

class _UchinchiOynaState extends State<UchinchiOyna> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
    'https://images.unsplash.com/photo-1470770903676-69b98201ea1c',
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6',
    'https://images.unsplash.com/photo-1519608487953-e999c86e7455',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    'https://images.unsplash.com/photo-1523875194681-bedd468c58bf',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 36,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[200],
            child: Image.network(images[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}

class TortinchiOyna extends StatefulWidget {
  const TortinchiOyna({super.key});

  @override
  State<TortinchiOyna> createState() => _TortinchiOynaState();
}

class _TortinchiOynaState extends State<TortinchiOyna> {
  final List<String> posts = [
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    'https://images.unsplash.com/photo-1501785888041-af3ef285b470',
    'https://images.unsplash.com/photo-1519608487953-e999c86e7455',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    'https://images.unsplash.com/photo-1470770903676-69b98201ea1c',
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6',
    'https://images.unsplash.com/photo-1523875194681-bedd468c58bf',
    'https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'javad',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: const [
          Icon(Icons.add_box_outlined, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Profil ma’lumotlari
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/1946/1946429.png',
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatColumn('8', 'Posts'),
                          _buildStatColumn('0', 'Followers'),
                          _buildStatColumn('0', 'Following'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'javad ahmad',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text('No posts here', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Tepa ikonlar (grid + tag)
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.grid_on_outlined),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.person_pin_outlined),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          // Postlar
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Image.network(posts[index], fit: BoxFit.cover);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
