///DNACheck(val1,val2,val3...)
///@param id
///@param val1
///@param val2
///@param val3...



for(var check = 0; check < ds_list_size(DNA)/DNA_LSIZE; check++)
{
	if(DNARead(DNA,check,DNA_NODE1) == argument0)
	{
			if(DNARead(DNA,check,DNA_NODE2) == argument1)
			{
				return 1;
			}
	}
}
return 0;