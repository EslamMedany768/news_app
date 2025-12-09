import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/sourcesRespone.dart';
import 'package:news_app/ui/home/categories/categories/cubit/source_states.dart';
import 'package:news_app/ui/home/categories/categories/cubit/source_view_model.dart';
import 'package:news_app/ui/home/categories/categories/tabBar/customTabBar.dart';

class SourceDetailsView extends StatefulWidget {
  SourceViewModel viewModel = SourceViewModel();
  String category;

  SourceDetailsView({super.key, required this.category});

  @override
  State<SourceDetailsView> createState() => _SourceDetailsViewState();
}

class _SourceDetailsViewState extends State<SourceDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    widget.viewModel.getSourcesCategories(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.viewModel,
      child: BlocBuilder<SourceViewModel, SourceState>(
        builder: (context, state) {
          if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                  onPressed: () {
                    widget.viewModel.getSourcesCategories(widget.category);
                  },
                  child: Text("Please Try Again"),
                ),
              ],
            );
          } else if (state is SourceSuccessState) {
            return CustomTabBar(sourcesList: state.sourcesList);
          } else {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
        },
      ),
    );
  }
}

//FutureBuilder<Source?>(
//       future: ApiManager.getSources(widget.category),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator(color: Colors.black));
//         } else if (snapshot.hasError) {
//
//         }
//         if (snapshot.data!.status == "error") {
//           return Column(
//             children: [
//               Text(snapshot.data!.message!),
//               ElevatedButton(
//                 onPressed: () {
//                   ApiManager.getSources(widget.category);
//                   setState(() {});
//                 },
//                 child: Text("Please Try Again"),
//               ),
//             ],
//           );
//         }
//         var sourceList = snapshot.data!.sources;
//         return CustomTabBar(sourcesList: sourceList);
//       },
//     )
