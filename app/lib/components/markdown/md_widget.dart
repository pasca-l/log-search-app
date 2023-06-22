import 'package:app/importer.dart';

class CustomMarkdown extends StatelessWidget {
  const CustomMarkdown({
    super.key,
    this.data,
  });

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: data,
      selectable: true,
      onTapLink: (text, href, title) {
        href != null ? launchUrl(Uri.parse(href)) : null;
      },
      builders: {
        'h1': MarkdownH1Builder(),
        'h2': MarkdownH2Builder(),
        'pre': MarkdownCodeBlockBuilder(),
        // 'hr': MarkdownHrBuilder(),
        // 'code': MarkdownInlineCodeBuilder(),
        // 'br': MarkdownBrBuilder(),
      },
      styleSheet: MarkdownStyleSheet(
        h3: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
        h4: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        h5: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        h6: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        // code: const TextStyle(
        //   backgroundColor: Colors.grey,
        // ),
      ),
    );
  }
}
