	for(var dnapos=0; dnapos<IHistory; dnapos++)
	{
		var node1 = DNA[| dnapos*4]+1000;
		var node2 = DNA[| dnapos*4+1]+1000;
		
		//show_message(string(node1) + "  |  " + string(node2));
		var en = DNA[| dnapos*4+3];
		//if(en)
		{
			if(ds_list_find_index(Nodes,node1)=-1)
			{
				Nodes[| NodeCount*3] = node1;
				Nodes[| NodeCount*3+1] = 0;
				Nodes[| NodeCount*3+2] = NEURON_HID
			
				if(node1-1000 < InputCount)
				{
					Nodes[| NodeCount*3+2] = NEURON_INP
					Inputs[InpAdded] = NodeCount;
					InpAdded++;
				}
				else if(node1-1000 >= InputCount and node1-1000 < InputCount+OutputCount)
				{
					Nodes[| NodeCount*3+2] = NEURON_OUT
					Outputs[OutAdded] = NodeCount;
					OutAdded++;
				}
				else
				{
					Nodes[| NodeCount*3+2] = NEURON_HID
				}
				show_debug_message("node 1 created id = " + string(Nodes[| NodeCount*3]) + " as a node type of " + string(Nodes[| NodeCount*3+2]))
				NodeCount++;
			
			}
		
			if(ds_list_find_index(Nodes,node2)=-1)
			{
				Nodes[| NodeCount*3] = node2;
				Nodes[| NodeCount*3+1] = -1;
				Nodes[| NodeCount*3+2] = NEURON_HID
			
				if(node2-1000 < InputCount)
				{
					Nodes[| NodeCount*3+2] = NEURON_INP
					Inputs[InpAdded] = NodeCount;
					InpAdded++;
				}
				else if(node2-1000 >= InputCount and node2-1000 < InputCount+OutputCount)
				{
					Nodes[| NodeCount*3+2] = NEURON_OUT
					Outputs[OutAdded] = NodeCount;
					OutAdded++;
				}
				else
				{
					Nodes[| NodeCount*3+2] = NEURON_HID
				}
				show_debug_message("node 2 created id = " + string(Nodes[| NodeCount*3]) + " as a node type of " + string(Nodes[| NodeCount*3+2]))
				NodeCount++;
			
			}
		
		}
		
	}
