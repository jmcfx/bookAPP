import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with TickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text("Discover",
                      style: TextStyle(
                          fontSize: 30,
                          height: 3,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                labelColor: Colors.black,
                controller: _tabController,
                indicatorColor: Colors.black12,
                tabs: const [
                  Tab(
                    text: "All Books",
                  ),
                  Tab(
                    text: "Free Books",
                  ),
                  Tab(
                    text: "Paid Books",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  AllTab(books: allBooks),
                  AllTab(books: freeBooks),
                  AllTab(books: paidBooks),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AllTab extends StatelessWidget {
  const AllTab({super.key, required this.books});
  final List<BookInfo> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          subtitle: Text(book.link,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              )),
          onTap: () async {
            final bookUri = Uri.parse(book.link);
            if (await canLaunchUrl(bookUri)) {
              await launchUrl(bookUri);
            }
          },
        );
      },
      itemCount: books.length,
    );
  }
}

class BookInfo {
  final String link;

  BookInfo({required this.link});
}

//All Books
final List<BookInfo> allBooks = [
  BookInfo(link: "https://www.smashwords.com"),
  BookInfo(link: "https://archive.org/details/texts"),
  BookInfo(link: "https://www.bookdepository.com"),
  BookInfo(link: "https://www.wattpad.com"),
  BookInfo(link: "https://www.free-ebooks.net"),
  BookInfo(link: "https://www.feedbooks.com"),
  BookInfo(link: "https://manybooks.net"),
  BookInfo(link: "https://www.hathitrust.org"),
  BookInfo(link: "https://www.freebooksy.com"),
  BookInfo(link: "https://www.ebookmall.com"),
  BookInfo(link: "http://www.bookbub.com"),
  BookInfo(link: "http://librivox.org"),
];
//Free List  Books ....

final List<BookInfo> paidBooks = [
  BookInfo(link: "https://www.amazon.com/Kindle-eBooks"),
  BookInfo(link: "https://www.barnesandnoble.com"),
  BookInfo(link: "https://www.kobo.com"),
  BookInfo(link: "https://www.apple.com/apple-books"),
  BookInfo(link: "https://play.google.com/store/books"),
  BookInfo(link: "https://www.ebooks.com"),
  BookInfo(link: "https://www.bookdepository.com"),
  BookInfo(link: "https://www.smashwords.com"),
  BookInfo(link: "https://www.scribd.com"),
  BookInfo(link: "https://www.gutenberg.org/ebooks")
];

//Paid Books...

final List<BookInfo> freeBooks = [
  BookInfo(link: "http://www.gutenberg.org"),
  BookInfo(link: "http://openlibrary.org"),
  BookInfo(link: "http://books.google.com"),
  BookInfo(link: "http://www.manybooks.net"),
  BookInfo(link: "http://librivox.org"),
  BookInfo(link: "https://archive.org/details/texts"),
  BookInfo(link: "http://www.bookbub.com"),
  BookInfo(link: "https://www.free-ebooks.net"),
  BookInfo(link: "https://www.feedbooks.com"),
];
