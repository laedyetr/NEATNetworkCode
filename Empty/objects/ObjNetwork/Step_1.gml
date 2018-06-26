for(var i=0; i<Alarms; i++)
{
	
	if(Alarm[i] = 0)
	{
		switch(i)
		{
			case 0:
				SetNeatRandom()
			break;
			
			case 1:
				
			break
			
			case 2:
				SetNeatMutate();
			break;
		}
	}
	
	Alarm[i] = floor(max(Alarm[i]-1,-1))
}

if(Update or keyboard_check_pressed(ord("P")))
{
	Update = false
	ds_list_destroy(Nodes); 
	Nodes = ds_list_create();
	for(var i=0; i<ds_list_size(DNA)/DNA_LSIZE; i++)
	{
		var node1 = DNARead(DNA,i,DNA_NODE1)+NODE_ID_OFFSET;
		var node2 = DNARead(DNA,i,DNA_NODE2)+NODE_ID_OFFSET;
		
		//show_debug_message(string(node1) + " | " + string(node2));
		
		//if(DNARead(DNA,i,DNA_ACTIVE))
		{
			//show_debug_message(ds_list_find_index(Nodes,node1));
			if(ds_list_find_index(Nodes,node1)=-1)
			{
				var type = NEURON_HID
				if(node1-NODE_ID_OFFSET < InputCount)
					type = NEURON_INP;
				else if(node1-NODE_ID_OFFSET >= InputCount and node1-NODE_ID_OFFSET < OutputCount+InputCount)
					type = NEURON_OUT;
				
				if(type == NEURON_INP)
				{
					Input[Inpcounter] = floor(ds_list_size(Nodes)/NODE_LSIZE);
					Inpcounter++;
					show_debug_message("pop")
				}
				
				if(type == NEURON_OUT)
				{
					Output[Outcounter] = floor(ds_list_size(Nodes)/NODE_LSIZE);
					Outcounter++;
					show_debug_message("dpop")
				}
					
				NodeAdd(Nodes,node1,0,type)
				//show_debug_message(node1-NODE_ID_OFFSET);
				
				show_debug_message("node1 " + string(node1) + " created " + "as a " + string(type));
			}
			
			//show_debug_message(ds_list_find_index(Nodes,node2));
			if(ds_list_find_index(Nodes,node2)=-1)
			{
				var type = NEURON_HID
				if(node2-NODE_ID_OFFSET < InputCount)
					type = NEURON_INP;
				else if(node2-NODE_ID_OFFSET >= InputCount and node2-NODE_ID_OFFSET < OutputCount+InputCount)
					type = NEURON_OUT;
				
				if(type == NEURON_INP)
				{
					Input[Inpcounter] = floor(ds_list_size(Nodes)/NODE_LSIZE);
					Inpcounter++;
					show_debug_message("pop")
				}
				
				if(type == NEURON_OUT)
				{
					Output[Outcounter] = floor(ds_list_size(Nodes)/NODE_LSIZE);
					Outcounter++;
					show_debug_message("depop")
				}
					
				NodeAdd(Nodes,node2,0,type)
				show_debug_message("node2 " + string(node2) + " created " + "as a " + string(type));
				
				//show_debug_message(node2-NODE_ID_OFFSET);
			}
		}
		
	}
	
	//show_message(ds_list_size(Nodes)/NODE_LSIZE);
}


if(keyboard_check_pressed(ord("K")))
{
	Alarm[2] = 1
}