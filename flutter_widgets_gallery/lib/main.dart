import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[200], // Light gray background
          appBar: AppBar(
            title: Text(
              'Material vs Cupertino Widgets',
              style: TextStyle(fontSize: 18), // Reduced font size
            ),
            bottom: TabBar(
              tabs: [Tab(text: 'Material'), Tab(text: 'Cupertino')],
            ),
          ),
          body: TabBarView(
            children: [MaterialWidgetsPage(), CupertinoWidgetsPage()],
          ),
        ),
      ),
    );
  }
}

// Material Widgets Page
class MaterialWidgetsPage extends StatefulWidget {
  const MaterialWidgetsPage({super.key});
  @override
  State<MaterialWidgetsPage> createState() => _MaterialWidgetsPageState();
}

class _MaterialWidgetsPageState extends State<MaterialWidgetsPage> {
  // Text input controllers
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFormFieldController =
      TextEditingController();

  // Widget states
  bool _checkboxValue = true;
  int _radioValue = 1;
  bool _switchValue = true;
  double _sliderValue = 0.5;
  int _bottomNavIndex = 0;
  int _railIndex = 0;
  Set<String> _segmentedValue = {'Option 1'};
  String _dropdownValue = 'Option 1';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isExpanded = false;

  @override
  void dispose() {
    _textFieldController.dispose();
    _textFormFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Widgets'),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HCome'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Home clicked!')));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Settings clicked!')));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Profile clicked!')));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About App'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('About App clicked!')));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Category: Buttons
          _buildCategoryTitle('Buttons'),
          _buildMaterialWidgetCard(
            'ElevatedButton',
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('ElevatedButton clicked!')),
                );
              },
              child: Text('Click me'),
            ),
            'Standard button with elevated effect.',
          ),
          _buildMaterialWidgetCard(
            'TextButton',
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('TextButton clicked!')));
              },
              child: Text('Click me'),
            ),
            'Button without background, for less important actions.',
          ),
          _buildMaterialWidgetCard(
            'OutlinedButton',
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('OutlinedButton clicked!')),
                );
              },
              child: Text('Click me'),
            ),
            'Button with border, no solid background.',
          ),
          _buildMaterialWidgetCard(
            'IconButton',
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('IconButton clicked!')));
              },
            ),
            'Button with an icon.',
          ),
          _buildMaterialWidgetCard(
            'FloatingActionButton',
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('FAB clicked!')));
              },
              child: Icon(Icons.add),
            ),
            'Floating button for primary actions.',
          ),
          _buildMaterialWidgetCard(
            'FloatingActionButton.extended',
            FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Extended FAB clicked!')),
                );
              },
              label: Text('Add'),
              icon: Icon(Icons.add),
            ),
            'Extended floating button with text and icon.',
          ),

          // Category: Text Input
          _buildCategoryTitle('Text Input'),
          _buildMaterialWidgetCard(
            'TextField',
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
              onChanged: (value) => setState(() {}),
            ),
            'Text input field. Input: ${_textFieldController.text}',
          ),
          _buildMaterialWidgetCard(
            'TextFormField',
            TextFormField(
              controller: _textFormFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
              onChanged: (value) => setState(() {}),
            ),
            'Form input field. Input: ${_textFormFieldController.text}',
          ),

          // Category: Navigation
          _buildCategoryTitle('Navigation'),
          _buildMaterialWidgetCard(
            'AppBar',
            SizedBox(
              height: 56,
              child: AppBar(
                title: Text('AppBar Example'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: null,
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Search clicked!')),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('More options clicked!')),
                      );
                    },
                  ),
                ],
              ),
            ),
            'Top bar for navigation.',
          ),
          _buildMaterialWidgetCard(
            'NavigationBar',
            SizedBox(
              height: 60,
              child: NavigationBar(
                selectedIndex: _bottomNavIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _bottomNavIndex = index;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected item: $index')),
                  );
                },
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
            'Modern bottom navigation bar (Material 3).',
          ),
          _buildMaterialWidgetCard(
            'TabBar',
            DefaultTabController(
              length: 3,
              child: SizedBox(
                height: 50,
                child: TabBar(
                  onTap: (index) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tab clicked! $index')),
                    );
                  },
                  tabs: [
                    Tab(icon: Icon(Icons.star), text: 'Tab 1'),
                    Tab(icon: Icon(Icons.favorite), text: 'Tab 2'),
                    Tab(icon: Icon(Icons.person), text: 'Tab 3'),
                  ],
                ),
              ),
            ),
            'Tab bar for navigation.',
          ),
          _buildMaterialWidgetCard(
            'NavigationRail',
            SizedBox(
              height: 200,
              width: 100,
              child: NavigationRail(
                selectedIndex: _railIndex,
                extended: false,
                minWidth: 80,
                groupAlignment: -1.0,
                onDestinationSelected: (index) {
                  setState(() {
                    _railIndex = index;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Destination clicked! $index')),
                  );
                },
                labelType: NavigationRailLabelType.all,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home', style: TextStyle(fontSize: 10)),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings', style: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ),
            'Vertical navigation for larger screens.',
          ),
          _buildMaterialWidgetCard(
            'BottomAppBar',
            SizedBox(
              height: 56,
              child: BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Home clicked!')),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Settings clicked!')),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile clicked!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            'Bottom bar for navigation and actions.',
          ),

          // Category: Information Display
          _buildCategoryTitle('Information Display'),
          _buildMaterialWidgetCard(
            'Card',
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Card Example'),
              ),
            ),
            'Container with rounded corners and shadow.',
          ),
          _buildMaterialWidgetCard(
            'ListTile',
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Title'),
              subtitle: Text('Subtitle'),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('ListTile clicked!')));
              },
            ),
            'List item with icon and text.',
          ),
          _buildMaterialWidgetCard(
            'SnackBar',
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('SnackBar Example'),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                  ),
                );
              },
              child: Text('Show SnackBar'),
            ),
            'Temporary message at the bottom of the screen.',
          ),
          _buildMaterialWidgetCard(
            'MaterialBanner',
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: Text('MaterialBanner Example'),
                    actions: [
                      TextButton(
                        onPressed:
                            () =>
                                ScaffoldMessenger.of(
                                  context,
                                ).hideCurrentMaterialBanner(),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Show MaterialBanner'),
            ),
            'Banner at the top of the screen.',
          ),
          _buildMaterialWidgetCard(
            'Divider',
            Divider(),
            'Horizontal line to separate content.',
          ),
          _buildMaterialWidgetCard(
            'ExpansionTile',
            ExpansionTile(
              title: Text('ExpansionTile Example'),
              children: [
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
              ],
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
            ),
            'Expandable list item. Expanded: $_isExpanded',
          ),
          _buildMaterialWidgetCard(
            'Chip',
            Chip(
              label: Text('Chip Example'),
              onDeleted: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Chip deleted!')));
              },
            ),
            'Small container for labels or actions.',
          ),
          _buildMaterialWidgetCard(
            'Tooltip',
            Tooltip(
              message: 'This is a Tooltip!',
              child: ElevatedButton(onPressed: () {}, child: Text('Hover me')),
            ),
            'Shows message on hover.',
          ),
          _buildMaterialWidgetCard(
            'DataTable',
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                ],
                rows: [
                  DataRow(cells: [DataCell(Text('1')), DataCell(Text('John'))]),
                ],
              ),
            ),
            'Table for displaying data.',
          ),
          _buildMaterialWidgetCard(
            'GridTile',
            SizedBox(
              width: 100,
              height: 80,
              child: GridTile(
                header: GridTileBar(
                  title: Text('Header', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.black54,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
            ),
            'Tile for grid display with header.',
          ),

          // Category: Dialogs
          _buildCategoryTitle('Dialogs'),
          _buildMaterialWidgetCard(
            'AlertDialog',
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text('Title'),
                        content: Text('This is an AlertDialog example.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Confirmed!')),
                              );
                            },
                            child: Text('Confirm'),
                          ),
                        ],
                      ),
                );
              },
              child: Text('Show AlertDialog'),
            ),
            'Dialog for alerts or confirmations.',
          ),
          _buildMaterialWidgetCard(
            'SimpleDialog',
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => SimpleDialog(
                        title: Text('Choose an option'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Option 1 selected!')),
                              );
                            },
                            child: Text('Option 1'),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Option 2 selected!')),
                              );
                            },
                            child: Text('Option 2'),
                          ),
                        ],
                      ),
                );
              },
              child: Text('Show SimpleDialog'),
            ),
            'Simple dialog with options.',
          ),
          _buildMaterialWidgetCard(
            'AboutDialog',
            ElevatedButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'My App',
                  applicationVersion: '1.0.0',
                );
              },
              child: Text('Show AboutDialog'),
            ),
            'Dialog with app information.',
          ),
          _buildMaterialWidgetCard(
            'BottomSheet',
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => Container(
                        width: double.infinity,
                        height: 200,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'BottomSheet Example',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Option 1 selected!')),
                                );
                              },
                              child: Text('Option 1'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Option 2 selected!')),
                                );
                              },
                              child: Text('Option 2'),
                            ),
                          ],
                        ),
                      ),
                );
              },
              child: Text('Show BottomSheet'),
            ),
            'Modal sheet that appears from the bottom.',
          ),

          // Category: Selection Controls
          _buildCategoryTitle('Selection Controls'),
          _buildMaterialWidgetCard(
            'Checkbox',
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxValue = value!;
                        });
                      },
                    ),
                    Text('Option 1'),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Checkbox(
                      value: !_checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxValue = !value!;
                        });
                      },
                    ),
                    Text('Option 2'),
                  ],
                ),
              ],
            ),
            'Button for multiple selections.',
          ),
          _buildMaterialWidgetCard(
            'Radio',
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    Text('Option 1'),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      },
                    ),
                    Text('Option 2'),
                  ],
                ),
              ],
            ),
            'Button for single selection.',
          ),
          _buildMaterialWidgetCard(
            'Switch',
            Column(
              children: [
                Row(
                  children: [
                    Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                    Text('Option 1'),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Switch(
                      value: !_switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = !value;
                        });
                      },
                    ),
                    Text('Option 2'),
                  ],
                ),
              ],
            ),
            'Toggle for on/off.',
          ),
          _buildMaterialWidgetCard(
            'SegmentedButton',
            SegmentedButton<String>(
              segments: [
                ButtonSegment(value: 'Option 1', label: Text('Option 1')),
                ButtonSegment(value: 'Option 2', label: Text('Option 2')),
                ButtonSegment(value: 'Option 3', label: Text('Option 3')),
              ],
              selected: _segmentedValue,
              onSelectionChanged: (newSelection) {
                setState(() {
                  _segmentedValue = newSelection;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${newSelection.first}')),
                );
              },
            ),
            'Button for selecting multiple options.',
          ),

          // Category: Sliders
          _buildCategoryTitle('Sliders'),
          _buildMaterialWidgetCard(
            'Slider',
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.tune),
                    SizedBox(width: 10),
                    Text('Adjustment'),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: Slider(
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                Text('Value: ${_sliderValue.toStringAsFixed(2)}'),
              ],
            ),
            'Slider for value selection.',
          ),

          // Category: Progress Indicators
          _buildCategoryTitle('Progress Indicators'),
          _buildMaterialWidgetCard(
            'LinearProgressIndicator',
            LinearProgressIndicator(),
            'Linear progress indicator.',
          ),
          _buildMaterialWidgetCard(
            'CircularProgressIndicator',
            CircularProgressIndicator(),
            'Circular progress indicator.',
          ),

          // Category: Pickers
          _buildCategoryTitle('Pickers'),
          _buildMaterialWidgetCard(
            'DatePicker',
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    _selectedDate = date;
                  });
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected date: $date')),
                  );
                }
              },
              child: Text('Show DatePicker'),
            ),
            'Date picker. Selected: $_selectedDate',
          ),
          _buildMaterialWidgetCard(
            'TimePicker',
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (time != null) {
                  setState(() {
                    _selectedTime = time;
                  });
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected time: $time')),
                  );
                }
              },
              child: Text('Show TimePicker'),
            ),
            'Time picker. Selected: ${_selectedTime.format(context)}',
          ),

          // Category: Menus
          _buildCategoryTitle('Menus'),
          _buildMaterialWidgetCard(
            'DropdownButton',
            DropdownButton<String>(
              value: _dropdownValue,
              items: [
                DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
              ],
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value!;
                });
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Selected: $value')));
              },
            ),
            'Dropdown menu for selection.',
          ),
          _buildMaterialWidgetCard(
            'PopupMenuButton',
            PopupMenuButton<String>(
              onSelected: (value) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Selected: $value')));
              },
              itemBuilder:
                  (context) => [
                    PopupMenuItem(value: 'Option 1', child: Text('Option 1')),
                    PopupMenuItem(value: 'Option 2', child: Text('Option 2')),
                  ],
            ),
            'Menu that appears on click.',
          ),
          _buildMaterialWidgetCard(
            'MenuAnchor',
            MenuAnchor(
              builder: (context, controller, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  child: Text('Open menu'),
                );
              },
              menuChildren: [
                MenuItemButton(
                  child: Text('Option 1'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Option 1 selected!')),
                    );
                  },
                ),
                MenuItemButton(
                  child: Text('Option 2'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Option 2 selected!')),
                    );
                  },
                ),
              ],
            ),
            'Flexible menu with custom options.',
          ),

          // Category: Miscellaneous
          _buildCategoryTitle('Miscellaneous'),
          _buildMaterialWidgetCard(
            'RefreshIndicator',
            SizedBox(
              height: 50,
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 1));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Refreshed!')));
                },
                child: ListView(children: [Text('Pull to refresh')]),
              ),
            ),
            'Indicator for refreshing content.',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMaterialWidgetCard(
    String name,
    Widget example,
    String description,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height:
                  name == 'NavigationRail'
                      ? 200
                      : name == 'ExpansionTile'
                      ? 200
                      : name == 'Slider'
                      ? 150
                      : 100,
              child: Center(child: example),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

// Cupertino Widgets Page
class CupertinoWidgetsPage extends StatefulWidget {
  const CupertinoWidgetsPage({super.key});
  @override
  State<CupertinoWidgetsPage> createState() => _CupertinoWidgetsPageState();
}

class _CupertinoWidgetsPageState extends State<CupertinoWidgetsPage> {
  // Text input controllers
  final TextEditingController _cupertinoTextFieldController =
      TextEditingController();
  final TextEditingController _cupertinoSearchController =
      TextEditingController();
  final TextEditingController _formFieldController = TextEditingController();

  // Widget states
  bool _switchValue = true;
  bool _checkboxValue = false;
  double _sliderValue = 0.5;
  int _tabBarIndex = 0;
  int _pickerValue = 0;
  int _radioValue = 1;
  DateTime _selectedDate = DateTime.now();
  Duration _selectedTimer = Duration(hours: 1);
  String _segmentedValue = 'Option 1';

  @override
  void dispose() {
    _cupertinoTextFieldController.dispose();
    _cupertinoSearchController.dispose();
    _formFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        // Category: Buttons
        _buildCategoryTitle('Buttons'),
        _buildCupertinoWidgetContainer(
          'CupertinoButton',
          CupertinoButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('CupertinoButton clicked!')),
              );
            },
            child: Text(
              'Click me',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          'iOS-style button with minimalist design.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoButton.filled',
          CupertinoTheme(
            data: CupertinoThemeData(primaryColor: CupertinoColors.activeBlue),
            child: CupertinoButton.filled(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('CupertinoButton.filled clicked!')),
                );
              },
              child: Text('Click me'),
            ),
          ),
          'iOS button with solid background.',
        ),

        // Category: Text Input
        _buildCategoryTitle('Text Input'),
        _buildCupertinoWidgetContainer(
          'CupertinoTextField',
          CupertinoTextField(
            controller: _cupertinoTextFieldController,
            placeholder: 'Enter text',
            onChanged: (value) => setState(() {}),
          ),
          'Text input field in iOS style. Input: ${_cupertinoTextFieldController.text}',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoSearchTextField',
          CupertinoSearchTextField(
            controller: _cupertinoSearchController,
            onChanged: (value) => setState(() {}),
          ),
          'Search field in iOS style. Input: ${_cupertinoSearchController.text}',
        ),

        // Category: Navigation
        _buildCategoryTitle('Navigation'),
        _buildCupertinoWidgetContainer(
          'CupertinoNavigationBar',
          SizedBox(
            height: 44,
            child: CupertinoNavigationBar(
              middle: Text('NavigationBar Example'),
              leading: Icon(
                CupertinoIcons.back,
                color: CupertinoColors.activeBlue,
              ),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text(
                  'Exit',
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
                onPressed: () {},
              ),
            ),
          ),
          'iOS navigation bar for titles and actions.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoTabBar',
          SizedBox(
            height: 50,
            child: CupertinoTabBar(
              currentIndex: _tabBarIndex,
              onTap: (index) {
                setState(() {
                  _tabBarIndex = index;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected item: $index')),
                );
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person),
                  label: 'Profile',
                ),
              ],
              activeColor:
                  CupertinoColors
                      .activeBlue, // Plava boja za tekst aktivnog taba
              inactiveColor: CupertinoColors.systemGrey,
            ),
          ),
          'iOS bottom navigation bar.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoPageScaffold',
          SizedBox(
            height: 50,
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page Scaffold'),
              ),
              child: Container(),
            ),
          ),
          'Basic page structure in iOS style.',
        ),

        // Category: Information Display
        _buildCategoryTitle('Information Display'),
        _buildCupertinoWidgetContainer(
          'CupertinoActivityIndicator',
          CupertinoActivityIndicator(),
          'Loading indicator in iOS style.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoSwitch',
          CupertinoSwitch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          'Toggle in iOS style.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoColors',
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                color: CupertinoColors.activeBlue,
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                color: CupertinoColors.activeGreen,
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                color: CupertinoColors.systemRed,
              ),
            ],
          ),
          'iOS style colors: activeBlue, activeGreen, systemRed.',
        ),

        // Category: Dialogs
        _buildCategoryTitle('Dialogs'),
        _buildCupertinoWidgetContainer(
          'CupertinoAlertDialog',
          CupertinoButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder:
                    (context) => CupertinoAlertDialog(
                      title: Text('Title'),
                      content: Text('This is a CupertinoAlertDialog example.'),
                      actions: [
                        CupertinoDialogAction(
                          child: Text(
                            'Close',
                            style: const TextStyle(
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        CupertinoDialogAction(
                          child: Text(
                            'Confirm',
                            style: const TextStyle(
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Confirmed!')),
                            );
                          },
                        ),
                      ],
                    ),
              );
            },
            child: Text(
              'Show CupertinoAlertDialog',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          'iOS-style dialog for alerts.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoActionSheet',
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => CupertinoActionSheet(
                      title: Text('Choose an action'),
                      actions: [
                        CupertinoActionSheetAction(
                          child: Text(
                            'Action 1',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Action 1 selected!')),
                            );
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text(
                            'Action 2',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Action 2 selected!')),
                            );
                          },
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text(
                          'Cancel',
                          style: const TextStyle(
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
              );
            },
            child: Text(
              'Show CupertinoActionSheet',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          'iOS-style modal action sheet.',
        ),

        // Category: Selection Controls
        _buildCategoryTitle('Selection Controls'),
        _buildCupertinoWidgetContainer(
          'CupertinoCheckBox',
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey),
                      borderRadius: BorderRadius.circular(4),
                      color:
                          _checkboxValue
                              ? CupertinoColors.activeBlue
                              : Colors.transparent,
                    ),
                    child: Checkbox(
                      value: _checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxValue = value!;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Checkbox: $value')),
                        );
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.transparent,
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Option 1'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey),
                      borderRadius: BorderRadius.circular(4),
                      color:
                          !_checkboxValue
                              ? CupertinoColors.activeBlue
                              : Colors.transparent,
                    ),
                    child: Checkbox(
                      value: !_checkboxValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxValue = !value!;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Checkbox: $value')),
                        );
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.transparent,
                      side: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Option 2'),
                ],
              ),
            ],
          ),
          'Checkbox in iOS style.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoRadio',
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: CupertinoColors.systemGrey),
                    ),
                    child: Radio<int>(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Radio: $value')),
                        );
                      },
                      fillColor: WidgetStateProperty.resolveWith(
                        (states) =>
                            states.contains(WidgetState.selected)
                                ? CupertinoColors.activeBlue
                                : Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Option 1'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: CupertinoColors.systemGrey),
                    ),
                    child: Radio<int>(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Radio: $value')),
                        );
                      },
                      fillColor: WidgetStateProperty.resolveWith(
                        (states) =>
                            states.contains(WidgetState.selected)
                                ? CupertinoColors.activeBlue
                                : Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Option 2'),
                ],
              ),
            ],
          ),
          'Radio button in iOS style.',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoSlidingSegmentedControl',
          CupertinoSlidingSegmentedControl<String>(
            children: {
              'Option 1': Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Option 1', style: TextStyle(fontSize: 12)),
              ),
              'Option 2': Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Option 2', style: TextStyle(fontSize: 12)),
              ),
              'Option 3': Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Option 3', style: TextStyle(fontSize: 12)),
              ),
            },
            groupValue: _segmentedValue,
            onValueChanged: (value) {
              setState(() {
                _segmentedValue = value!;
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Selected: $value')));
            },
          ),
          'Segmented selection with sliding animation.',
        ),

        // Category: Sliders
        _buildCategoryTitle('Sliders'),
        _buildCupertinoWidgetContainer(
          'CupertinoSlider',
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.slider_horizontal_3),
                  SizedBox(width: 10),
                  Text('Adjustment'),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: CupertinoSlider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 1.0,
                  divisions: 100,
                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Value: ${value.toStringAsFixed(2)}'),
                      ),
                    );
                  },
                ),
              ),
              Text('Value: ${_sliderValue.toStringAsFixed(2)}'),
            ],
          ),
          'Slider for value selection in iOS style.',
        ),

        // Category: Pickers
        _buildCategoryTitle('Pickers'),
        _buildCupertinoWidgetContainer(
          'CupertinoPicker',
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => Container(
                      height: 200,
                      color: Colors.white,
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            _pickerValue = index;
                          });
                        },
                        children: [
                          Text('Option 1'),
                          Text('Option 2'),
                          Text('Option 3'),
                        ],
                      ),
                    ),
              );
            },
            child: Text(
              'Show CupertinoPicker',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          'Value picker in iOS style. Selected: $_pickerValue',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoDatePicker',
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => Container(
                      height: 200,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        initialDateTime: _selectedDate,
                        onDateTimeChanged: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                      ),
                    ),
              );
            },
            child: Text(
              'Show CupertinoDatePicker',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          'Date picker in iOS style. Selected: $_selectedDate',
        ),
        _buildCupertinoWidgetContainer(
          'CupertinoTimerPicker',
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder:
                    (context) => Container(
                      height: 200,
                      color: Colors.white,
                      child: CupertinoTimerPicker(
                        initialTimerDuration: _selectedTimer,
                        onTimerDurationChanged: (duration) {
                          setState(() {
                            _selectedTimer = duration;
                          });
                        },
                      ),
                    ),
              );
            },
            child: Text(
              'Show CupertinoTimerPicker',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          'Timer picker in iOS style. Selected: $_selectedTimer',
        ),

        // Category: Forms
        _buildCategoryTitle('Forms'),
        _buildCupertinoWidgetContainer(
          'CupertinoFormSection',
          SizedBox(
            height: 200,
            child: CupertinoFormSection(
              header: Text('Form Example'),
              children: [
                CupertinoFormRow(
                  prefix: Text('Name'),
                  child: CupertinoTextField(
                    controller: _formFieldController,
                    placeholder: 'Enter text',
                    onChanged: (value) => setState(() {}),
                  ),
                ),
                CupertinoFormRow(
                  prefix: Text('Notifications'),
                  child: CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          'Form section in iOS style.',
        ),

        // Category: Lists
        _buildCategoryTitle('Lists'),
        _buildCupertinoWidgetContainer(
          'CupertinoListSection',
          ClipRect(
            child: SizedBox(
              height: 200,
              child: CupertinoListSection(
                header: Text('List Example'),
                additionalDividerMargin: 0,
                children: [
                  CupertinoListTile(
                    title: Text('Item 1', style: TextStyle(fontSize: 14)),
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item 1 clicked!')),
                      );
                    },
                  ),
                  CupertinoListTile(
                    title: Text('Item 2', style: TextStyle(fontSize: 14)),
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item 2 clicked!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          'List section in iOS style.',
        ),

        // Category: Menus
        _buildCategoryTitle('Menus'),
        _buildCupertinoWidgetContainer(
          'CupertinoContextMenu',
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  child: Text('Action 1', style: TextStyle(fontSize: 14)),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Action 1 selected!')),
                    );
                  },
                ),
                CupertinoContextMenuAction(
                  child: Text('Action 2', style: TextStyle(fontSize: 14)),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Action 2 selected!')),
                    );
                  },
                ),
              ],
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(CupertinoIcons.mail, color: Colors.blue),
              ),
            ),
          ),
          'Contextual menu in iOS style (long press).',
        ),
      ],
    );
  }

  Widget _buildCategoryTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCupertinoWidgetContainer(
    String name,
    Widget example,
    String description,
  ) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height:
                name == 'CupertinoListSection' || name == 'CupertinoFormSection'
                    ? 200
                    : name == 'CupertinoSlider'
                    ? 150
                    : 100,
            child: Center(child: example),
          ),
          SizedBox(height: 10),
          Text(description),
        ],
      ),
    );
  }
}
