enum Direction { north, east, south, west }
//create a class call robot
class Robot {
  int x;
  int y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  @override
  String toString() {
    return "Position($x, $y), Direction: ${direction.name}";
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
  void handleInstruction(String symbol){  //should change to a list of actions
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
  Robot robot1 = Robot(7, 3, Direction.north);
  print(robot1);
}
