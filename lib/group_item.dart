library devaloop_group_item;

import 'package:flutter/material.dart';

class GroupItem extends StatelessWidget {
  final String? title;
  final List<GroupContent> contents;

  const GroupItem({
    super.key,
    this.title,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(title!.toUpperCase()),
            ),
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: contents[index].leading,
                title: Text(contents[index].title),
                subtitle: Text(contents[index].subtitle),
                trailing: contents[index].trailing,
                onTap: contents[index].detail == null
                    ? null
                    : () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                contents[index].detail!.detailPage,
                          ),
                        );

                        if (contents[index].detail!.onDetailPageClosed !=
                            null) {
                          await contents[index]
                              .detail!
                              .onDetailPageClosed!
                              .call(result);
                        }
                      },
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: contents.length,
            ),
          )
        ],
      ),
    );
  }
}

class GroupContent {
  final dynamic key;
  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final Detail? detail;

  GroupContent({
    this.key,
    this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.detail,
  });
}

class Detail {
  final Widget detailPage;
  final dynamic Function(dynamic result)? onDetailPageClosed;

  Detail({required this.detailPage, this.onDetailPageClosed});
}
