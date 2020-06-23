class Day3
{
    static public function main():Void
    {
        var inputs:Array<Int> = ThisIsCool.getData('Day3', 1);

        var opPosition:Int = 0;

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
        

        trace(inputs[0]);
    }
}


