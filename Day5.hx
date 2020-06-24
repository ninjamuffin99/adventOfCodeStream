class Day5
{
    static public function main():Void
    {
        var userInput:Int = 5;
        var inputs:Array<Int> = ThisIsCool.getData('Day5pt1', 1);
        var outputs:Array<Int> = [];
        trace(inputs);

        var opPosition:Int = 0;

        while (inputs[opPosition] != 99)
        {
            var curOp:Int = inputs[opPosition];

            var curMode:Int = 0;
            var modeArray:Array<Int> = [];

            var positionArray:Array<Int> = [];

            if (curOp >= 100)
            {
                var fullOp = curOp;
                curOp = curOp % 100;
                fullOp = Math.floor(fullOp / 100);

                while (fullOp != 0)
                {
                    modeArray.push(fullOp % 10);
                    fullOp -= fullOp % 10;
                    fullOp = Math.floor(fullOp / 10);
                    trace(fullOp);
                }
            }

            while (positionArray.length < 3)
            {
                if (modeArray[0] != null)
                {
                    curMode = modeArray[0];
                }
                else
                    curMode = 0;

                switch (curMode)
                {
                    case 0:
                        positionArray.push(inputs[opPosition + positionArray.length + 1]);
                    case 1:
                        positionArray.push(opPosition + positionArray.length + 1);
                }
                modeArray.remove(modeArray[0]);
            }

            var amountOfParameters:Int = 4;

            switch (curOp)
            {
                case 1: // Addition
                    inputs[positionArray[2]] = inputs[positionArray[0]] + inputs[positionArray[1]];
                case 2: // Multiply
                    inputs[positionArray[2]] = inputs[positionArray[0]] * inputs[positionArray[1]];
                case 3:
                    inputs[positionArray[0]] = userInput;
                    amountOfParameters = 2;
                case 4:
                    outputs.push(inputs[positionArray[0]]);
                    amountOfParameters = 2;
                case 5: // jump if true
                    if (inputs[positionArray[0]] != 0)
                    {
                        opPosition = inputs[positionArray[1]];
                        amountOfParameters = 0;
                    }
                    else
                        amountOfParameters = 3;
                case 6: // jump if false
                    if (inputs[positionArray[0]] == 0)
                    {
                        opPosition = inputs[positionArray[1]];
                        amountOfParameters = 0;
                    }
                    else
                        amountOfParameters = 3;
                case 7: // less than
                    if (inputs[positionArray[0]] < inputs[positionArray[1]])
                    {
                        inputs[positionArray[2]] = 1;
                    }
                    else
                    {
                        inputs[positionArray[2]] = 0;
                    }
                    
                case 8: //equals to
                    if (inputs[positionArray[0]] == inputs[positionArray[1]])
                    {
                        inputs[positionArray[2]] = 1;
                    }
                    else
                    {
                        inputs[positionArray[2]] = 0;
                    }

                default:
                    throw "ERROR READING OPCODE: " + curOp;
            }


            

            opPosition += amountOfParameters;
            
        }
        
        trace(inputs);
        trace(outputs);
        trace(inputs[0]);
    }
}


