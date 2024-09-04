import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/Search/filter/filter.dart';
import 'package:internshala/Search/provider/filter_provider.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          iconColor: Colors.blue,
          foregroundColor: Colors.blue,
          side: const BorderSide(color: Colors.blue),
          minimumSize: const Size(0, 0),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 6,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilterScreen(),
            ),
          );
        },
        child: const Row(
          children: [
            Icon(
              Icons.filter_alt_outlined,
              size: 16,
            ),
            SizedBox(width: 4),
            Text("Filters")
          ],
        ),
      ),
    );
  }
}

class ScrollableChipsWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width - 110,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...(filterState.locations ?? []).map(
              (location) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(filterProvider.notifier).removeLocation(location);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 0),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 6,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(location),
                      SizedBox(width: 4),
                      Icon(
                        Icons.close,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ...(filterState.profileNames ?? []).map((profile) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: OutlinedButton(
                    onPressed: () {
                      ref
                          .read(filterProvider.notifier)
                          .removeProfileName(profile);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      minimumSize: const Size(0, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(profile),
                        SizedBox(width: 4),
                        Icon(
                          Icons.close,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                )),
            ...(filterState.durations ?? []).map((duration) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: OutlinedButton(
                    onPressed: () {
                      ref
                          .read(filterProvider.notifier)
                          .removeDuration(duration);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 0),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(duration),
                        SizedBox(width: 4),
                        Icon(
                          Icons.close,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
