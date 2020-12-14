import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver test'),
            // floating: true,
            // expandedHeight: 100,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        // AspectRatio(
                        //   aspectRatio: 3 / 4,
                        //   child: Image.network(
                        //     'https://avatars1.githubusercontent.com/u/15212018?s=400&u=6c7451e78f89c5bf44488bea8d6eb2daa40a28e0&v=4',
                        //   ),
                        // ),
                        Image.network(
                          'https://avatars1.githubusercontent.com/u/15212018?s=400&u=6c7451e78f89c5bf44488bea8d6eb2daa40a28e0&v=4',
                          height: 180,
                        ),
                        Text(
                          'Rodrigo Rafael',
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text('List 1'),
                );
              },
              childCount: 10,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: List.generate(
              20,
              (index) => Image.network(
                'https://avatars1.githubusercontent.com/u/15212018?s=400&u=6c7451e78f89c5bf44488bea8d6eb2daa40a28e0&v=4',
                height: 180,
              ),
            ).toList(),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  hoverColor: Colors.grey,
                  title: Text('List 2'),
                );
              },
              childCount: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('List 3'),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
