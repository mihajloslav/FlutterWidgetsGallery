import 'package:flutter/material.dart';

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
