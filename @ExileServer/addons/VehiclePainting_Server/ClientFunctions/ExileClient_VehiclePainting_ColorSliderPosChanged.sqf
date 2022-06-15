_Red = sliderPosition 1900;
_Green = sliderPosition 1901;
_Blue = sliderPosition 1902;

//calculate colour
_colour = Format["#(argb,8,8,3)color(%1,%2,%3,1)",_Red,_Green,_Blue];

//set preview box colour
ctrlSetText [1200, _colour];

//Set object Texture
ExileClientModelBoxVehicle setObjectTexture [lbCurSel 2100, _colour];
