import 'package:federicoviceconti_github_io/home_page/blog/blog_item.dart';
import 'package:federicoviceconti_github_io/home_page/blog/blog_notifier.dart';
import 'package:federicoviceconti_github_io/home_page/widget/cursor_widget.dart';
import 'package:federicoviceconti_github_io/utility/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlogWidget extends StatefulWidget {
  @override
  _BlogWidgetState createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
              AppLocalizations.of(context)!.blog,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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

  Widget? _buildImage(String? imageUrl) {
    final isSmallScreen = MediaQuery.of(context).size.width < 400;
    if (imageUrl != null && !isSmallScreen) {
      return ImageHelper.getPng(imageUrl, width: 150);
    } else {
      return null;
    }
  }
}
