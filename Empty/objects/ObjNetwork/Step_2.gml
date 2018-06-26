
var NodeSums = ds_list_create();
repeat(floor(ds_list_size(Nodes)/NODE_LSIZE)+1)ds_list_add(NodeSums,0);


for(var dnapos = 0; dnapos<ds_list_size(DNA)/DNA_LSIZE; dnapos++)
{
	var node1 = DNARead(DNA,dnapos,DNA_NODE1)+NODE_ID_OFFSET;
	var node2 = DNARead(DNA,dnapos,DNA_NODE2)+NODE_ID_OFFSET;
	
	if(DNARead(DNA,dnapos,DNA_ACTIVE))
	{
		node1 = real(ds_list_find_index(Nodes,node1))/NODE_LSIZE
		node2 = real(ds_list_find_index(Nodes,node2))/NODE_LSIZE

		
		NodeSums[| node2] += 
		NodeRead(Nodes,node1,NODE_VALUE) * DNARead(DNA,dnapos,DNA_WEIGHT);
		
		//Nodes[| node1*NODE_LSIZE+NODE_VALUE] * 
		//DNA[| dnapos*DNA_LSIZE+DNA_WEIGHT];

	}
}

for(var nodes = 0; nodes < ds_list_size(Nodes)/NODE_LSIZE; nodes++)
{
	if(NodeRead(Nodes,nodes,NODE_ID)-NODE_ID_OFFSET >= InputCount)
	NodeSet(Nodes,nodes,NODE_VALUE,clamp(sigmoid(NodeSums[| nodes]),-1,1))
}
ds_list_destroy(NodeSums);
