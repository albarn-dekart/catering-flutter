import 'package:catering_app/Classes/order.dart';
import 'package:flutter/material.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/user.dart';

class OrdersPage extends StatefulWidget {
  final User? user;

  const OrdersPage({super.key, this.user});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> orders = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  Future<void> _getOrders() async {
    setState(() => isLoading = true);

    final fetchedOrders = await Order.getAll(widget.user);

    setState(() {
      orders = fetchedOrders;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageTitle =
        widget.user != null ? 'ID ${widget.user?.id} Orders' : 'My Orders';

    return Scaffold(
      appBar: CateringAppBar(title: pageTitle),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (orders.isEmpty) return _buildEmptyState();

    return ListView.separated(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      itemCount: orders.length,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppTheme.defaultPadding),
      itemBuilder: (context, index) => OrderCard(
        order: orders[index],
        onOrderDeleted: (Order order) {
          setState(() => orders.remove(order));
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket, size: 64, color: Colors.grey[400]),
          const SizedBox(height: AppTheme.defaultPadding),
          const Text(
            'No orders found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
