import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/Search/filter/filter.dart';
import 'package:internshala/Search/provider/filter_provider.dart';
import 'package:internshala/Search/provider/internship_provider.dart';
import 'package:internshala/Search/widgets/filter_widget.dart';
import 'package:internshala/Search/widgets/internship_block.dart';

class SearchPage extends ConsumerStatefulWidget {
  SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final internships = ref.watch(internshipProvider);
    final filterState = ref.watch(filterProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Internships",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 20, right: 20),
                    //   child: Icon(Icons.search),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    if ((filterState.locations ?? []).isEmpty &&
                        (filterState.durations ?? []).isEmpty &&
                        (filterState.profileNames ?? []).isEmpty)
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            const Spacer(),
                            FilterButton(),
                            const Spacer(),
                          ],
                        ),
                      )
                    else
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 24,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: FilterButton(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ScrollableChipsWidget(),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
                Text(
                  "${internships.length} total internships",
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                const Divider(
                  thickness: 2,
                  color: Color.fromARGB(114, 202, 202, 202),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 169,
                child: ListView.builder(
                  itemCount: internships.length,
                  itemBuilder: (context, index) {
                    final internship = internships[index];
                    return InternshipBlock(internship: internship);
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
