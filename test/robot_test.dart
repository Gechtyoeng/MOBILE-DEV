import 'package:test/test.dart';
import '../W1-PART2/BONUS-1.dart';

main() {
  test('Move robot - Case 1', () {
    Robot robot = Robot(7, 3, Direction.north);
    robot.handleInstruction("RAALAL");

    print("Final state = $robot");

    expect(robot.x, equals(9));
    expect(robot.y, equals(4));
    expect(robot.direction, equals(Direction.west));
  });
}
