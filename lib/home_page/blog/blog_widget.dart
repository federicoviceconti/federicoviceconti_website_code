import 'package:federicoviceconti_github_io/home_page/blog/blog_item.dart';
import 'package:federicoviceconti_github_io/home_page/blog/blog_notifier.dart';
import 'package:federicoviceconti_github_io/home_page/widget/cursor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class BlogWidget extends StatefulWidget {
  @override
  _BlogWidgetState createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addObserver(this);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<BlogNotifier>(
        context,
        listen: false,
      ).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              "Blog",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
            ),
          ),
          _buildBlogItems()
        ],
      ),
    );
  }

  Widget _buildBlogItems() {
    return Consumer<BlogNotifier>(
      builder: (_, notifier, child) {
        final blogItems = notifier.blogItems;

        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) => _buildTile(
            blogItems[index],
            onTap: () => notifier.onBlogItemTap(index),
          ),
          separatorBuilder: (_, __) => Container(
            width: 10,
            color: Theme.of(context).dividerColor,
          ),
          itemCount: blogItems.length,
        );
      },
    );
  }

  Widget _buildTile(
    BlogItem item, {
    void Function()? onTap,
  }) {
    return CursorWidget(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: ListTile(
            mouseCursor: SystemMouseCursors.click,
            leading: _buildImage(item.imageUrl),
            title: Text(
              item.title,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            subtitle: Text(
              item.description,
            ),
          ),
        ),
      ),
    );
  }

  _buildImage(String? imageUrl) {
    final isSmallScreen = MediaQuery.of(context).size.width < 400;
    if (imageUrl != null && !isSmallScreen) {
      return Image.asset(
        'assets/png/$imageUrl.png',
        width: 150,
        fit: BoxFit.cover,
      );
    } else {
      return null;
    }
  }
}
