var HiddenCount = NodeCount - InputCount+OutputCount;
var HiddenAng = 360 / HiddenCount;
var _x = argument0,_y = argument1;	

for(var node=0; node<NodeCount; node++)
{
	
	//show_debug_message(Nodes[| node*3+2])
	var x1 = 0;
	var y1 = 0;
	
	var col = 0;
	var low = abs( clamp(Nodes[| node*3+1],-1,0) )
	var high = clamp(Nodes[| node*3+1],0,1)
	col = make_colour_rgb(255*low,0,255*high);
	//show_debug_message(Nodes[| node*3+1])
	
	
	switch(Nodes[| node*3+2])
	{
		case NEURON_INP:
			x1 = _x-96;
			y1 = _y+((Nodes[| node*3]-1000)*38)
			draw_circle_outline(x1,y1,8,1,col);
		break;
		case NEURON_OUT:
			x1 = _x+96;
			y1 = _y+((Nodes[| node*3]-1000-InputCount)*38)
			draw_circle_outline(x1,y1,8,1,col);
		break;
		
		case NEURON_HID:
			var n = ((Nodes[| node*3]-1000-InputCount-OutputCount))
			x1 = _x + lengthdir_x(64,HiddenAng*(n- InputCount+OutputCount));
			y1 = _y+48 + lengthdir_y(64,HiddenAng*(n- InputCount+OutputCount));
			draw_circle_outline(x1,y1,8,1,col);
		break;
	}
	/*
	draw_set_colour(c_gray)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(x1,y1,string(Nodes[| node*3+1]))*/
}


//Draw and update
//if(keyboard_check_pressed(ord("O")))
for(var dnapos=0; dnapos<IHistory; dnapos++)
{
	var node1 = DNA[| dnapos*4]+1000;
	var node2 = DNA[| dnapos*4+1]+1000;
	
	
	
	node1 = real(ds_list_find_index(Nodes,node1))/3
	node2 = real(ds_list_find_index(Nodes,node2))/3
	
	
	
	var en = DNA[| dnapos*4+3];
	
	
	//show_debug_message(string(node1) + " | " + string(node2));
	
	var x1 = _x;
	var y1 = _y;
	var x2 = _x-16;
	var y2 = _y;
	
	if(en)
	{
		switch(Nodes[| node1*3+2])
		{
			case NEURON_INP:
				x1 = _x-96;
				y1 = _y+((Nodes[| node1*3]-1000)*38)
				//draw_circle_outline(x,y+((Nodes[| node1*3]-1000)*8),3,1,c_orange);
				//show_debug_message("node 1 is an input")
			break;
			
			case NEURON_OUT:
				x1 = _x+96;
				y1 = _y+((Nodes[| node1*3]-1000-InputCount)*38)
				//draw_circle_outline(x+96,y+((Nodes[| node1*3]-1000-Inputs)*8),3,1,c_orange);
				//show_debug_message("node 1 is an output")
			break;
			
			case NEURON_HID:
				var n = ((Nodes[| node1*3]-1000-InputCount-OutputCount))
				x1 = _x + lengthdir_x(64,HiddenAng*(n- InputCount+OutputCount));
				y1 = _y+48 + lengthdir_y(64,HiddenAng*(n- InputCount+OutputCount));
				//draw_circle_outline(x1,y1,3,1,c_orange);
				//show_debug_message("node 1 is an hidden")
			break;
		}
	
		switch(Nodes[| node2*3+2])
		{
			case NEURON_INP:
				x2 = _x;
				y2 = _y+((Nodes[| node2*3]-1000)*38)
				//draw_circle_outline(x,y+((Nodes[| node1*3]-1000)*8),3,1,c_orange);
				//show_debug_message("node 2 is an input")
			break;
			
			case NEURON_OUT:
				x2 = _x+96;
				y2 = _y+((Nodes[| node2*3]-1000-InputCount)*38)
				//draw_circle_outline(x+96,y+((Nodes[| node1*3]-1000-Inputs)*8),3,1,c_orange);
				//show_debug_message("node 2 is an output")
			break;
			
			case NEURON_HID:
				var n = ((Nodes[| node2*3]-1000-InputCount-OutputCount))
				x2 = _x + lengthdir_x(64,HiddenAng*(n- InputCount+OutputCount));
				y2 = _y+48 + lengthdir_y(64,HiddenAng*(n- InputCount+OutputCount));
				//draw_circle_outline(x1,y1,3,1,c_orange);
				//show_debug_message("node 2 is an hidden")
			break;
		}
	
		
		var col = 0;
		var low = abs( clamp(DNA[| dnapos*4+2],-1,0) )
		var high = clamp(DNA[| dnapos*4+2],0,1)
		col = make_colour_rgb(255*low,0,255*high);
		//show_debug_message(Nodes[| node*3+1])
		draw_line_width_color(x1,y1,x2,y2,2,col,col);
		
		
		//show_debug_message("created line from node " + string(node1) + " of type " + string(Nodes[| node1*3+2]) + 
		//" to node " + string(node2) + " of type " + string(Nodes[| node2*3+2]));
		
	}
}
