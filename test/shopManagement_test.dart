import 'package:test/test.dart';
import '../W2-PART2/EX-4.dart';

void main() {
  test('case1', () {
    Product p1 = Product(productName: 'apple', price: 1.5, quantity: 10);
    Product p2 = Product(productName: 'banana', price: 2.5, quantity: 10);
    Product p3 = Product(productName: 'durain', price: 5, quantity: 10);

    Customer c1 = Customer(name: 'gechty', contact: '088567890');
    Order o1 = Order(customer: c1, productOrders: []);
    o1.addProductOrder(p1, 1);
    o1.addProductOrder(p2, 2);
    o1.addProductOrder(p3, 1);

    print('the total amount is : ${o1.totalAmount()}');
    expect(o1.totalAmount(), 11.5);
  });

  test('case2', (){
    Product p1 = Product(productName: 'apple', price: 1.5, quantity: 3);
    Customer c1 = Customer(name: 'gechty', contact: '088567890');
    Order o1 = Order(customer: c1, productOrders: []);
    
    expect(() => o1.addProductOrder(p1, 4), throwsA(isA<Exception>()));
  });
}