enum Direction { north, east, south, west }
//create a class call robot
class Robot {
  int x;
  int y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  @override
  String toString() {
    return "($x, $y)";
  }
  
  //handle direction when turn left
  void trunLeft(){
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        break;
      case Direction.west:
        direction = Direction.south;
        break;
      case Direction.south:
        direction = Direction.east;
        break;
      case Direction.east:
        direction = Direction.north;
        break;
    } 
  }
  //handle direaction when trun right
  void turnRight(){
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        break;
      case Direction.east:
        direction = Direction.south;
        break;
      case Direction.south:
        direction = Direction.west;
        break;
      case Direction.west:
        direction = Direction.north;
        break;
    } 
  }

  //handle advance 
  void advance(){
    switch (direction) {
      case Direction.north:
        y++;
        break;
      case Direction.east:
        x++;
        break;
      case Direction.south:
        y--;
        break;
      case Direction.west:
        x--;
        break;
    } 
  }

  //handle instruction
  void handleInstruction(String symbol){
    for(var i = 0; i < symbol.length; i++){
      switch(symbol[i]) {
        case 'A':
          advance();
          break;
        case 'R':
          turnRight();
          break;
        case 'L':
          trunLeft();
          break;
      }
    }   
    }

}
void main() {
  // // Initial position {7, 3} and facing north
  // int x = 7;
  // int y = 3;
  // Direction direction = Direction.north;

  // // Example instruction sequence
  // const instructions = "RAALAL";

  // // Process the instructions and get the final position and direction
  

  // // Print the final position and direction
  // print("Final position:  ");
  // print("Facing:  ");
  Robot robot1 = Robot(7, 3, Direction.north);
  print('The final position is $robot1');
  print('Facing: ${robot1.direction.name}');

}
