import sys.io.File;

class ThisIsCool
{
    static public function getData(path:String, ?splitType:Int = 0, ?chosenSplit:Int = 0):Array<Int>
    {
        path = "./inputs/" + path + ".txt";
        var output:Array<Int> = [];
        var unparsed:String = File.getContent(path);

        var splitString:String = "\n";
        var chosenArray:String = "";


        var isWires:Bool = false;

        if (unparsed.charAt(0) == "R" || unparsed.charAt(0) == "L" || unparsed.charAt(0) == "U" || unparsed.charAt(0) == "D")
        {
            isWires = true;
        }

        switch (splitType)
        {
            case 0:
                splitString = "\n";
            case 1:
                splitString = ",";

        }

        
        if (splitType == 1)
        {
            var daSplit:Array<Dynamic> = unparsed.split("\n");
            for (item in daSplit) {
                item.split(',');
            }
    
            chosenArray = daSplit[chosenSplit];
        }

        var stringArray:Array<String> = chosenArray.split(splitString);

        var dataLeft = stringArray.length;
        var i:Int = 0;
        while (dataLeft > 0)
        {
            if (isWires)
            {
                var convertedInt:Int = 0;
                var direction:String = stringArray[i].charAt(0);

                switch (direction)
                {
                    case "U":
                        convertedInt = 0;
                    case "R":
                        convertedInt = 1;
                    case "D":
                        convertedInt = 2;
                    case "L":
                        convertedInt = 3;
                }

                output.push(convertedInt);
                output.push(Std.parseInt(stringArray[i].substring(1)));
            }
            else
            {
                output.push(Std.parseInt(stringArray[i]));
            }

            i++;
            dataLeft -= 1;
        }

        // trace(output);
       
        return output;
    }
}