Nodes = ds_list_create()
DNA = ds_list_create()


InputCount = 2;
Input[0] = 0;
Inpcounter = 0;

OutputCount = 1;
Output[0] = 0
Outcounter = 0

HiddenCount = 0

Alarm[0] = -1;
Alarms = 3;
/// alarm 0 = set random
/// alarm 1 = set copy
/// alarm 2 = set mutate

Alarm[0] = 0;
MutateAm = 1;
Alarm[2] = 0;
Update = false;