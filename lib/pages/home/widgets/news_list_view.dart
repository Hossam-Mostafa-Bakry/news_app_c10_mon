import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_mon/pages/home/viewModels/articlesCubit/cubit.dart';
import 'package:news_app_c10_mon/pages/home/widgets/tab_item.dart';

import '../../../models/source_model.dart';
import 'article_list_widget.dart';

class NewsListView extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListView({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  int selectedIndex = 0;

  var cubitViewModel = ArticlesCubit();

  @override
  void initState() {
    cubitViewModel.getNewsArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitViewModel,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DefaultTabController(
            length: widget.sourcesList.length,
            initialIndex: selectedIndex,
            child: TabBar(
              padding: const EdgeInsets.symmetric(vertical: 15),
              isScrollable: true,
              indicator: const BoxDecoration(),
              labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
              dividerColor: Colors.transparent,
              dividerHeight: 0,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  cubitViewModel
                      .getNewsArticles(widget.sourcesList[selectedIndex].id);
                });
              },
              tabs: widget.sourcesList
                  .map(
                    (e) => TabItem(
                      sourceModel: e,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(e),
                    ),
                  )
                  .toList(),
            ),
          ),
          ArticleListWidget(
            sourceId: widget.sourcesList[selectedIndex].id,
          ),
        ],
      ),
    );
  }
}
