import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/search/models/profileid_list.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({
    super.key,
    required this.color,
    required this.iconImage,
    required this.text,
    required this.height,
    required this.width,
    required this.onTitleSelected,
    required this.selectedTitle,
  });

  final Color color;
  final Image iconImage;
  final String text;
  final double height;
  final double width;
  final ValueChanged<String> onTitleSelected;
  final String selectedTitle;

  @override
  _TextFieldSearchState createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
        showSearch(context: context, delegate: ProfileSearchDelegate())
            .then((value) {
          if (value != null && value is ProfileDetails) {
            widget.onTitleSelected(value.title);
          } 
        });
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xff666666),
            width: 0.2,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              widget.iconImage,
              SizedBox(
                width: screenWidth * 0.03,
              ),
              Expanded(
                child: Text(
                  widget.selectedTitle.isEmpty
                      ? widget.text
                      : widget.selectedTitle,
                  style: lexend(const Color(0xff000000), 12, FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSearchDelegate extends SearchDelegate<ProfileDetails> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ProfileDetails> myList = loadProfileDetails().where((profile) {
      return profile.title.toLowerCase().contains(query.toLowerCase()) ||
          profile.category.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return myList.isEmpty
        ? const Text('No Results Found')
        : ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              final ProfileDetails listItem = myList[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(listItem.imageUrl),
                ),
                title: Text(listItem.title),
                subtitle: Text(listItem.category),
                onTap: () {
                  Navigator.of(context).pop(listItem);
                },
              );
            },
          );
  }
}
