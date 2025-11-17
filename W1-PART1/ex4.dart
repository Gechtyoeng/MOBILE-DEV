void main() {
  
// Declare two strings: firstName and lastName and an integer:age
  String firstName = 'Oeng';
  String lastName = 'gechty';
  int age = 20;

// Concatenate the 2 strings and the age 
 String concat = firstName + lastName + age.toString();

// Print result
  print(concat);

// ==Lists:
// Create a list of integers
List<int> integer = [1, 2, 3];
// Add a number to the list
integer.add(4);

// Remove a number from the list
integer.remove(2);

// Insert a number at a specific index in the list
integer[0] = 9;
// Iterate over the list and print each number
for(var i in integer) {
  print(i);
}

//== Maps:
// Create a map with String keys and integer values
var values = Map<String, int>();
// Add a new key-value pair to the map
values['first'] = 1;
values['second'] = 2;
// Remove a key-value pair from the map
values.remove('first');
// Iterate over the map and print each key-value pair
values.forEach((key, value) => print(value));
}