NodeCount = 0;
Nodes = ds_list_create();
/*
0 = node id
1 = node value
2 = node type
*/


IHistory = 0;
DNA = ds_list_create();
/*
0 = node 1
1 = node 2
2 = enabled
*/
Inputs[0] = 0;
InputCount = 5;
InpAdded = 0;


Outputs[0] = 0;
OutputCount = 5;
OutAdded = 0;
Draw = true;

for(var node=0; node<InputCount; node++)
{
	for(var nodeo=0; nodeo<OutputCount; nodeo++)
	{
		DNA[| IHistory*4] = node
		DNA[| IHistory*4+1] = InputCount+nodeo
		DNA[| IHistory*4+2] = random(2)-1;
		DNA[| IHistory*4+3] = true;
		
		IHistory++;
	}
}
ScrNodesUpdate();



Owner = noone;

repeat(8)
{
	for(var dnapos=0; dnapos<IHistory; dnapos++)
	{
		var node1 = DNA[| dnapos*4];
		var node2 = DNA[| dnapos*4+1];
		//Mutate test
		if(DNA[| dnapos*4+3])
		if(random(5)<1)
		{
			var type = choose(0,1,2,2,2,2);
		
			switch(type)
			{
				case 0:
					
					DNA[| IHistory*4] = node1;
					var n2 = irandom(NodeCount-2)
					if(n2 < Inputs)break;
					show_debug_message("connected node " + string(node1) + " to node " + string(n2));
					//{
						//n2 = irandom(NodeCount-1)
					//}
					DNA[| IHistory*4+1] = n2;
					DNA[| IHistory*4+2] = random(2)-1;
					DNA[| IHistory*4+3] = true;
					IHistory++;
					
					Update = true;
				break
			
				case 1:
					DNA[| dnapos*4+3] = false;
					
					DNA[| IHistory*4] = node1;
					DNA[| IHistory*4+1] = NodeCount;
					DNA[| IHistory*4+2] = random(2)-1;
					DNA[| IHistory*4+3] = true;
					IHistory++;
					
					DNA[| IHistory*4] = NodeCount;
					DNA[| IHistory*4+1] = node2;
					DNA[| IHistory*4+2] = random(2)-1;
					DNA[| IHistory*4+3] = true;
					IHistory++;
					
					show_debug_message("created node " + string(NodeCount) + " inbetween node " + string(node1) + " and node " + string(node2));
					
					Update = true;
				break
			
				case 2:
					DNA[| dnapos*4+2] = random(2)-1;
					//FirstGen = false;
				break
			}
		}
	}
	
	ScrNodesUpdate();
}