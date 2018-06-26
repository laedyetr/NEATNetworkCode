ds_list_clear(DNA);


for(var _inp = 0; _inp < InputCount; _inp++)
{
	for(var _out = 0; _out < OutputCount; _out++)
	{
		DNAAdd(DNA,_inp,_out+InputCount,random(2)-1,true);
	}
}
Update = true;

InputCount = 2;
Input[0] = 0;
Inpcounter = 0;

OutputCount = 1;
Output[0] = 0
Outcounter = 0

show_debug_message("set random");