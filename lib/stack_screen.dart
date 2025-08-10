import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'BookDetailScreen.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({super.key});

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  List<Map<String, String>> books = [
    {'title': 'I Love You Since 1892', 'image': 'assets/Read/ilys1892.png'},
    {'title': 'Dosage of Serotonin', 'image': 'assets/Read/dos.png'},
    {'title': 'Mistakes We Can\'t Laugh About', 'image': 'assets/Read/mwcla.png'},
    {'title': 'Six of Crows', 'image': 'assets/Read/soc.png'},
    {'title': 'Crooked Kingdom', 'image': 'assets/Read/ck.png'},
    {'title': 'Babel', 'image': 'assets/Read/babel.png'},
    {'title': 'Dead Poets Society', 'image': 'assets/Read/dps.png'},
    {'title': 'When the Elephant Dances', 'image': 'assets/Read/elephant.png'},
    {'title': 'The Red Palace', 'image': 'assets/Read/redpalace.png'},
  ];

  Future<void> _openBookDetail(BuildContext context, int index) async {
    final book = books[index];

    final updatedBook = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(
          title: book['title']!,
          author: getAuthorForBook(book['title']!),
          image: book['image']!,
          pages: getPagesForBook(book['title']!),
          language: "English",
          description: getDescriptionForBook(book['title']!),
          onBack: () => Navigator.pop(context),
        ),
      ),
    );

    if (updatedBook != null) {
      setState(() {
        books[index] = updatedBook;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: Column(
          children: [
            // 🔝 Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF918D8C),
                      border: Border.all(color: const Color(0xFF918D8C), width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'READN’REFLECT',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3C090E),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 2, width: double.infinity, color: Color(0xFF3C090E)),
            const SizedBox(height: 6),
            const Text(
              'READ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C090E),
              ),
            ),
            const SizedBox(height: 6),
            Container(height: 2, width: double.infinity, color: Color(0xFF3C090E)),
            const SizedBox(height: 10),

            // 📚 Book Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  itemCount: books.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return GestureDetector(
                      onTap: () => _openBookDetail(context, index),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              book['image']!,
                              height: 175,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book['title']!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3C090E),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔎 Helpers
String getAuthorForBook(String title) {
  switch (title) {
    case 'I Love You Since 1892':
      return 'Binibining Mia';
    case 'Dosage of Serotonin':
      return 'Inksteady';
    case 'Mistakes We Can\'t Laugh About':
      return 'Inksteady';
    case 'Six of Crows':
      return 'Leigh Bardugo';
    case 'Crooked Kingdom':
      return 'Leigh Bardugo';
    case 'Babel':
      return 'R.F. Kuang';
    case 'Dead Poets Society':
      return 'N.H. Kleinbaum';
    case 'When the Elephant Dances':
      return 'Tess Uriza Holthe';
    case 'The Red Palace':
      return 'June Hur';
    default:
      return 'Unknown Author';
  }
}

int getPagesForBook(String title) {
  switch (title) {
    case 'I Love You Since 1892':
      return 480;
    case 'Dosage of Serotonin':
      return 600;
    case 'Mistakes We Can\'t Laugh About':
      return 800;
    case 'Six of Crows':
      return 480;
    case 'Crooked Kingdom':
      return 576;
    case 'Babel':
      return 560;
    case 'Dead Poets Society':
      return 176;
    case 'When the Elephant Dances':
      return 384;
    case 'The Red Palace':
      return 352;
    default:
      return 300;
  }
}

String getDescriptionForBook(String title) {
  switch (title) {
    case 'I Love You Since 1892':
      return "Tells the story of Carmela Isabella, a modern-day woman who travels back in time to 1892 Spanish colonial Philippines. She must change the fate of her ancestor, Carmelita Montecarlos, and her love interest, Juanito Alfonso, while also preventing herself from falling in love with Juanito. The book explores themes of love, history, and the consequences of choices across time.";
    case 'Dosage of Serotonin':
      return "Is a contemporary romance novel that explores the complexities of mental health, healing, and love. The story follows characters who navigate the challenges of anxiety and depression, finding solace and hope in each other’s company. It delves deeply into emotional struggles, self-discovery, and the importance of understanding and support. With heartfelt moments and realistic portrayals of mental health issues, Dosage of Serotonin is a touching narrative about overcoming inner battles and finding happiness through connection.";
    case 'Mistakes We Can\'t Laugh About':
      return "Is a heartfelt contemporary romance that dives into the complexities of relationships marked by regret, forgiveness, and growth. The story centers on characters who have made serious mistakes—those that can’t easily be brushed off or joked about—and how they confront the consequences of their actions. It explores themes of accountability, healing emotional wounds, and learning to trust again. Through its raw and sincere storytelling, the book highlights how love can be messy but also a powerful catalyst for change and redemption.";
    case 'Six of Crows':
      return "Is a dark, thrilling fantasy novel set in the gritty, dangerous city of Ketterdam. The story follows six outcasts and criminals, each with their own troubled pasts and unique skills, who come together for an impossible heist. Led by the clever and ruthless Kaz Brekker, they must infiltrate a heavily guarded fortress to retrieve a priceless secret that could change the world. Filled with complex characters, high-stakes action, intricate plots, and a touch of magic, Six of Crows is a gripping tale of friendship, trust, and survival against all odds.";
    case 'Crooked Kingdom':
      return "Crooked Kingdom continues the story of Kaz Brekker and his crew as they face new threats and challenges after their daring heist in Ketterdam. The stakes are higher, the dangers deadlier, and the debts deeper. As betrayals unfold and old enemies resurface, the crew must band together to protect each other and survive the ruthless underworld. With sharp dialogue, intricate plotting, and rich character development, Crooked Kingdom is a thrilling and satisfying follow-up that explores themes of loyalty, revenge, and the cost of power.";
    case 'Babel':
      return "Is a historical fantasy novel set in 19th-century England, centered around a brilliant young woman, Robin Swift, who is sent to the prestigious Royal Institute of Translation, also known as Babel. There, she studies language, magic, and translation, discovering that words hold powerful, mystical abilities. As Robin becomes entangled in political intrigue, colonialism, and resistance movements, she must navigate the complexities of empire, identity, and rebellion. Babel blends rich world-building with sharp commentary on power, language, and cultural conflicts, delivering a thought-provoking and emotionally gripping story.";
    case 'Dead Poets Society':
      return "The story is set in 1959 at the prestigious Welton Academy, a boys' boarding school known for its strict traditions. The narrative follows a group of students who are inspired by their new English teacher, John Keating, to revitalize a secret society called the Dead Poets Society.";
    case 'When the Elephant Dances':
      return "Is a moving historical novel set during the final days of the American occupation of the Philippines in World War II. The story centers on a Filipino family struggling to survive amidst the chaos, danger, and heartbreak of war. Through their eyes, readers experience the harsh realities of battle, the bonds of family, and the resilience of the human spirit. The novel beautifully captures Filipino culture, traditions, and the enduring hope that persists even in the darkest times.";
    case 'The Red Palace':
      return "Is a gripping historical mystery set in 18th-century Korea during the Joseon Dynasty. The story follows a young court lady named So-hwa who is summoned to the royal palace to solve a suspicious death that could threaten the stability of the kingdom. As she navigates palace intrigues, dangerous secrets, and political conspiracies, So-hwa must use her intelligence and courage to uncover the truth. Rich in atmosphere and historical detail, The Red Palace combines suspense, cultural depth, and a strong, determined heroine in a captivating tale.";
    default:
      return "No description available.";
  }
}
