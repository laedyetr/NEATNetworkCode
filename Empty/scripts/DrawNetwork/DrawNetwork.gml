var netx1 = argument0
var nety1 = argument1
var netx2 = argument2
var nety2 = argument3
var netW = netx2 - netx1;
var netH = nety2 - nety1;
var Rad = netW*0.02;

var HidRad = min(netW/2-Rad*8,netH/2-Rad*8);
var HidAngle = 360 / (ds_list_size(Nodes)/NODE_LSIZE - InputCount - OutputCount);
//draw_rectangle(netx1,nety1,netx2,nety2,true);

//Draw Connections
for(var inp=0; inp < Inpcounter; inp++)
{
	//show_debug_message("poope2")
	_ID = NodeRead(Nodes,Input[inp],NODE_ID)-NODE_ID_OFFSET
	var dx = netx1 + Rad;
	var dy = nety1 + Rad + (_ID/(InputCount))*netH;
	draw_circle_colour(dx,dy,Rad*1.8,c_green,c_green,false)
}

for(var out=0; out < Outcounter; out++)
{
	//show_debug_message("pooper")
	_ID = NodeRead(Nodes,Output[out],NODE_ID)-NODE_ID_OFFSET
	var dx = netx1 + netW - Rad;
	var dy = nety1 + Rad + ((_ID-InputCount)/(OutputCount))*netH;
	draw_circle_colour(dx,dy,Rad*1.8,c_red,c_red,false)
}
_ID = noone;
dx = 0;
dy = 0;
/*
			var dx = netx1 + Rad;
			var dy = nety1 + Rad + (_ID/(InputCount))*netH;
			
			draw_circle_outline(dx,dy,Rad,1,col)
		
		break;
		
		case NEURON_OUT:
		
			
			var dx = netx1 + netW - Rad;
			var dy = nety1 + Rad + ((_ID-InputCount)/(OutputCount))*netH;
*/


for(var dnapos=0; dnapos < ds_list_size(DNA)/DNA_LSIZE; dnapos++)
{
	var node1 = DNARead(DNA,dnapos,DNA_NODE1)+NODE_ID_OFFSET;
	var node2 = DNARead(DNA,dnapos,DNA_NODE2)+NODE_ID_OFFSET;
	var node1 = ds_list_find_index(Nodes,node1)/NODE_LSIZE;
	
	var node2 = ds_list_find_index(Nodes,node2)/NODE_LSIZE;
	//show_debug_message(string(node1) + " | " + string(node2));
	
	var dx1 = 0;
	var dy1 = 0;
	var dx2 = 32;
	var dy2 = 32;
	var col1 = GetValueColour(DNARead(DNA,dnapos,DNA_WEIGHT),make_colour_rgb(239,93,203),make_colour_rgb(239,190,70));
	var col2 = GetValueColour(DNARead(DNA,dnapos,DNA_WEIGHT),make_colour_rgb(239,93,203),make_colour_rgb(239,190,70));
	
	if(DNARead(DNA,dnapos,DNA_ACTIVE) and node1!=-1 and node2!=-1)
	{
		var _ID1 = NodeRead(Nodes,node1,NODE_ID)-NODE_ID_OFFSET;
		var _ID2 = NodeRead(Nodes,node2,NODE_ID)-NODE_ID_OFFSET;
		
		switch(NodeRead(Nodes,node1,NODE_TYPE))
		{
			case NEURON_INP:
				dx1 = netx1 + Rad;
				dy1 = nety1 + Rad + (_ID1/(InputCount))*netH;
				//show_message("inp");
			break;
		
			case NEURON_OUT:
				dx1 = netx1 + netW - Rad;
				dy1 = nety1 + Rad + ((_ID1-InputCount)/(OutputCount))*netH;
				//show_message("out");
			break;
		
		
			case NEURON_HID:
				dx1 = netx1 + netW/2 + lengthdir_x(HidRad,(_ID1-InputCount - OutputCount)*HidAngle);
				dy1 = nety1 + netH/2 + lengthdir_y(HidRad,(_ID1-InputCount - OutputCount)*HidAngle);
				//show_message("hid");
			break;
		}
		switch(NodeRead(Nodes,node2,NODE_TYPE))
		{
			case NEURON_INP:
				dx2 = netx1 + Rad;
				dy2 = nety1 + Rad + (_ID2/(InputCount))*netH;
				//show_message("inp");
			break;
		
			case NEURON_OUT:
				dx2 = netx1 + netW - Rad;
				dy2 = nety1 + Rad + ((_ID2-InputCount)/(OutputCount))*netH;
				//show_message("out");
			break;
		
			case NEURON_HID:
				dx2 = netx1 + netW/2 + lengthdir_x(HidRad,(_ID2-InputCount - OutputCount)*HidAngle);
				dy2 = nety1 + netH/2 + lengthdir_y(HidRad,(_ID2-InputCount - OutputCount)*HidAngle);
				//show_message("hid");
			break;
		}
		
		
		draw_line_width_colour(dx1,dy1,dx2,dy2,2,col1,c_white);
	}
}

for(var netpos=0; netpos < ds_list_size(Nodes)/NODE_LSIZE; netpos++)
{
	var _ID = NodeRead(Nodes,netpos,NODE_ID)-NODE_ID_OFFSET;
	
	var col = GetValueColour(NodeRead(Nodes,netpos,NODE_VALUE),make_colour_rgb(239,93,203),make_colour_rgb(239,190,70));
	
	switch(NodeRead(Nodes,netpos,NODE_TYPE))
	{
		case NEURON_INP:
		
			
			var dx = netx1 + Rad;
			var dy = nety1 + Rad + (_ID/(InputCount))*netH;
			
			draw_circle_outline(dx,dy,Rad,1,col)
		
		break;
		
		case NEURON_OUT:
		
			
			var dx = netx1 + netW - Rad;
			var dy = nety1 + Rad + ((_ID-InputCount)/(OutputCount))*netH;
			
			draw_circle_outline(dx,dy,Rad,1,col)
			//game_end()
		break;
		
		
		case NEURON_HID:
		
			
			var dx = netx1 + netW/2 + lengthdir_x(HidRad,(_ID-InputCount - OutputCount)*HidAngle);
			var dy = nety1 + netH/2 + lengthdir_y(HidRad,(_ID-InputCount - OutputCount)*HidAngle);
			draw_circle_outline(dx,dy,Rad,1,col)
			//game_end()
		break;
	}
}

