class Day4
{
    static public function main():Void
    {
        var numMin:Int = 372037;
        var numMax:Int = 905157;

        var possibilities:Int = 0;
        while (numMin < numMax)
        {

            var daNumber:Int = numMin;
            numMin++;

            var stringNumb:String = Std.string(daNumber);

            var coolNumbers:Array<Int> = [];
            var adjacent:Bool = false;
            var trueAdjacent:Bool = false;
            var rising:Bool = true;

            for (i in 0...stringNumb.length)
            {
                coolNumbers.push(Std.parseInt(stringNumb.charAt(i)));
            }

            for (i in 0...coolNumbers.length)
            {
                var yaBoy:Int = coolNumbers[i];
                

                if (i > 0 && yaBoy == coolNumbers[i - 1])
                {
                    adjacent = true;

                    if (i > 1 && yaBoy == coolNumbers[i - 2])
                    {
                        adjacent = false;
                    }
                    else if (yaBoy != coolNumbers[i + 1])
                    {
                        trueAdjacent = true;
                    }
                }


                if (i < coolNumbers.length - 1 && yaBoy > coolNumbers[i + 1])
                {
                    rising = false;
                    // trace('not rising');
                }
            }

            if (rising && (adjacent || trueAdjacent))
                possibilities++;

        }

        trace(possibilities);
    }
}