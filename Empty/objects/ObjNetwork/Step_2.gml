ScrNodesUpdate();

var NodeSums = ds_list_create();
repeat(NodeCount)ds_list_add(NodeSums,0);


//Draw and update
//if(keyboard_check_pressed(ord("O")))
for(var dnapos=0; dnapos<IHistory; dnapos++)
{
	var node1 = DNA[| dnapos*4]+1000;
	var node2 = DNA[| dnapos*4+1]+1000;
	
	node1 = real(ds_list_find_index(Nodes,node1))/3
	node2 = real(ds_list_find_index(Nodes,node2))/3
	
	
	NodeSums[| node2] = NodeSums[| node2] + Nodes[| node1*3+1] * DNA[| dnapos*4+2];
}




for(var nodes = InputCount; nodes < NodeCount; nodes++)
{
	//show_debug_message(NodeSums[| nodes])
	//if(Nodes[| nodes*3] > InputCount)
	Nodes[| nodes*3+1] = clamp(NodeSums[| nodes],-1,1);
}
ds_list_destroy(NodeSums);


