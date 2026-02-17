import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/core/common/empty_widget.dart';
import 'package:moviesearch/core/common/error_widget.dart';
import 'package:moviesearch/core/common/initial_state.dart';
import 'package:moviesearch/core/common/loading_widget.dart';
import 'package:moviesearch/features/movies/presentation/search_bloc/search_bloc.dart';
import 'package:moviesearch/features/movies/presentation/widgets/search_text_field.dart';

import '../widgets/search_result_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  void _search(String query) {
    context.read<SearchBloc>().add(SearchMoviesEvent(query.trim()));
  }

  void _clear() {
    controller.clear();
    context.read<SearchBloc>().add(ClearSearchEvent());
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Search Result',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            SearchField(
              controller: controller,
              onSubmitted: _search,
              onClear: _clear,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const SearchLoadingWidget();
                  }

                  if (state is SearchLoaded) {
                    return SearchResultSection(movies: state.movies);
                  }

                  if (state is SearchEmpty) {
                    return const SearchEmptyWidget();
                  }

                  if (state is SearchError) {
                    return SearchErrorWidget(
                      message: state.message,
                      onRetry: () => _search(controller.text),
                    );
                  }

                  return const SearchInitialWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
