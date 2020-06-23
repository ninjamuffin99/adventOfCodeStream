class Day3butActuallyDay2pt2
{
    static public function main():Void
    {
        var inputs:Array<Int> = ThisIsCool.getData('Day3butActuallyDay2pt2', 1);

        var opPosition:Int = 0;
        var timesFailed:Int = -1;
        var pos1Int:Int = 1;
        var pos2Int:Int = 1;

        while (inputs[0] != 19690720)
        {
            timesFailed += 1;
            inputs = ThisIsCool.getData('Day3butActuallyDay2pt2', 1);
            opPosition = 0;

            inputs[1] = pos1Int;
            inputs[2] = pos2Int;

            while (inputs[opPosition] != 99)
            {
                var curOp:Int = inputs[opPosition];

                switch (curOp)
                {
                    case 1:
                        inputs[inputs[opPosition + 3]] = inputs[inputs[opPosition + 1]] + inputs[inputs[opPosition + 2]];
                    case 2:
                        inputs[inputs[opPosition + 3]] = inputs[inputs[opPosition + 1]] * inputs[inputs[opPosition + 2]];
                }

                opPosition += 4;
            }

            trace('BUSTED INPUT?? == ' + inputs[1] + " - " + inputs[2]);

            pos2Int++;

            if (pos2Int >= 99)
            {
                pos2Int = 0;
                pos1Int++;
            }

        }
        
        

        trace(inputs[1] + " - " + inputs[2]);
        trace(timesFailed);
        trace(100 * inputs[1] + inputs[2]);
    }
}


