import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmHot.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HmSlider()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(child: HmCategory()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(child: HmSuggestion()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Flex(
              children: [
                Expanded(child: HmHot()),
                SizedBox(width: 10),
                Expanded(child: HmHot()),
              ],
              direction: Axis.horizontal,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        HmMoreList(),
      ],
    );
  }
}
