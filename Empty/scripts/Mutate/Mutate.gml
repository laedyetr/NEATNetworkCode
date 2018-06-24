///Mutate(n)

n = argument0;

if(random(18)<1)
{
n = clamp(argument0 + (random(2)-1),-1,1);
}

return n;