part of 'widgets.dart';

class CustomTabbar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  const CustomTabbar({ required this.selectedIndex, required this.titles, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: titles
                .map(
                  (e) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap(titles.indexOf(e));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(
                        e,
                        style: (titles.indexOf(e) == selectedIndex)
                            ? TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)
                            : TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1.5,
                                blurRadius: 2,
                                color: (titles.indexOf(e) == selectedIndex)
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent)
                          ],
                          color: (titles.indexOf(e) == selectedIndex)
                              ? Colors.white
                              : Colors.transparent),
                    ),
                  ),
                ],
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }
}
