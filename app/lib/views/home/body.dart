import 'package:app/importer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.counter,
    this.child,
  });

  final int counter;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString("assets/documents/test.md"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Markdown(
                builders: {
                  'h1': MarkdownH1Builder(),
                  'h2': MarkdownH2Builder(),
                  'code': MarkdownCodeBlockBuilder(),
                },
                selectable: true,
                data: snapshot.data,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
