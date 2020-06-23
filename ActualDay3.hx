class ActualDay3
{

    static var bigGrid:Array<Array<Int>> = [for (x in 0...100000) []];
    static public function main():Void 
    {
        var wire1:Array<Int> = ThisIsCool.getData('ActualDay3', 1, 0);
        var wire2:Array<Int> = ThisIsCool.getData('ActualDay3', 1, 1);

        trace(bigGrid);

        simulateWire(wire1);
        var overlapPoints:Array<Dynamic> = simulateWire(wire2, true);

        var minDist:Int = 1000000;
        for (i in overlapPoints)
        {
            // PART 1
            // minDist = Std.int(Math.min(minDist, ((Math.abs(i[0] - 50000)) + (Math.abs(i[1] - 50000)))));
            // part 2
            minDist = Std.int(Math.min(minDist, i[2]));
        }

        trace('finished');
        // trace(bigGrid);
        
        // trace (grid1);
        trace(minDist);
        // trace(grid2.length);
    }

    static public function simulateWire(wire:Array<Int>, ?compare:Bool = false, ?otherGrid:Array<Dynamic>):Array<Dynamic>
    {
        var grid:Array<Dynamic> = [];
        // 0, 0 is bottom left!
        var curX:Int = 50000;
        var curY:Int = 50000;

        var daLoop:Int = 0;
        var steps:Int = 0;
        while (daLoop < wire.length)
        {
            var direction:Int = wire[daLoop];
            var length:Int = wire[daLoop + 1];
            

            while (length > 0)
            {
                steps++;

                switch direction
                {
                    case 0:
                        curY++;
                    case 1:
                        curX++;
                    case 2:
                        curY--;
                    case 3:
                        curX--;
                }

                
                if (compare && bigGrid[curX][curY] >= 1000000)
                {
                    grid.push([curX, curY, steps + (bigGrid[curX][curY] - 1000000)]);
                    trace('OVERLAPS');
                }
                

                if (!compare)
                    bigGrid[curX][curY] = 1000000 + steps;
               
                

                length--;
            }

            daLoop += 2;
        }

        return grid;
    }
}