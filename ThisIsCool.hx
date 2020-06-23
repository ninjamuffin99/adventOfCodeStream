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
            trace(chosenArray);
        }

        var stringArray:Array<String> = chosenArray.split(splitString);

        for (i in stringArray)
        {
            output.push(Std.parseInt(i));
        }

        // trace(output);
       
        return output;
    }
}