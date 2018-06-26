for(var dnapos = 0; dnapos < ds_list_size(DNA)/DNA_LSIZE; dnapos++)
{
	var node1 = DNARead(DNA,dnapos,DNA_NODE1);
	var node2 = DNARead(DNA,dnapos,DNA_NODE2);
	
	if(random(global.MutationFactor) < 1)
	{
		var type = choose(0,0,2,1);//0,0,1,2);
		
		switch(type)
		{
			case 0:
				DNASet(DNA,dnapos,DNA_WEIGHT,random(2)-1);
			break
			
			case 1:
				if(DNARead(DNA,dnapos,DNA_ACTIVE))
				{
					DNASet(DNA,dnapos,DNA_ACTIVE,false);
				
					var newNode = floor(ds_list_size(Nodes)/NODE_LSIZE);
					DNAAdd(DNA,node1,newNode,random(2)-1,true);
					DNAAdd(DNA,newNode,node2,random(2)-1,true);
					show_debug_message("created node " + string(newNode) + " inbetween node " + string(node1) + " and node " + string(node2));
					Update = true;
				}
			break;
			
			case 2:
				var newNode = irandom(floor(ds_list_size(DNA)/DNA_LSIZE-1))
				if(newNode < InputCount)break;
				if(DNACheck(node1,newNode))
				{
					show_debug_message("dnone")
					break;
				}
				DNAAdd(DNA,node1,newNode,random(2)-1,true);
				Update = true;
			break;
		}
	}
}