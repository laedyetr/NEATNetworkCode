///GetValueColour(val,col1,col2)
///@param val
///@param col1
///@param col2


var _col1,_col2;
_col1[0] = colour_get_red(argument1)
_col1[1] = colour_get_green(argument1)
_col1[2] = colour_get_blue(argument1)

_col2[0] = colour_get_red(argument2)
_col2[1] = colour_get_green(argument2)
_col2[2] = colour_get_blue(argument2)


var _l = abs(max(0,argument0));
var _h = min(0,argument0);

return make_colour_rgb(_col1[0]*_l - _col2[0]*_h,_col1[1]*_l - _col2[1]*_h,_col1[2]*_l - _col2[2]*_h);