private["_display","_title","_titleControl","_description","_descriptionBackground"];
disableSerialization;
_display = uiNamespace getVariable "RscExileConstructionMode";
if (!isNull _display) then
{
	_title = "";
	_structuredText = "<t align='left'>Free Mode</t><t align='right' color='#3fd4fc'>1</t><br/><t align='left'>Grid Mode</t><t align='right' color='#3fd4fc'>2</t><br/><t align='left'>Snap Mode</t><t align='right' color='#3fd4fc'>3</t><br/><t align='left'>Vector Mode</t><t align='right' color='#3fd4fc'>7</t><br/><br/><t align='left'>Toggle Physics</t><t align='right' color='#3fd4fc'>4</t><br/><t align='left'>Toggle Assistant</t><t align='right' color='#3fd4fc'>5</t><br/><t align='left'>Freeze Object</t><t align='right' color='#3fd4fc'>6</t><br/><t align='left'>Reset Dir/Vector</t><t align='right' color='#3fd4fc'>Ctrl + 7</t><br/><br/><t align='left'>Rotation</t><t align='right' color='#3fd4fc'>Q/E</t><br/><t align='left'>Elevation</t><t align='right' color='#3fd4fc'>PAGE UP/DOWN</t><br/><t align='left'>Distance</t><t align='right' color='#3fd4fc'>HOME/END</t><br/><br/><t align='left'>Larger Steps</t><t align='right' color='#3fd4fc'>SHIFT</t><br/><t align='left'>Smaller Steps</t><t align='right' color='#3fd4fc'>CONTROL</t><br/><br/><t align='left'>Place</t><t align='right' color='#3fd4fc'>SPACE</t><br/><t align='left'>Abort</t><t align='right' color='#3fd4fc'>ESCAPE</t>";
	switch (ExileClientConstructionMode) do 
	{
		case 1: { _title = "FREE MODE"; };
		case 2: { _title = "GRID MODE"; };
		case 3: { _title = "SNAP MODE"; };
	};
	if (ExileClientIsInVectorBuilding) then
	{
		_title = _title + " + VECTOR MODE";
		_structuredText = "<t align='left'>Free Mode</t><t align='right' color='#3fd4fc'>1</t><br/><t align='left'>Grid Mode</t><t align='right' color='#3fd4fc'>2</t><br/><t align='left'>Snap Mode</t><t align='right' color='#3fd4fc'>3</t><br/><t align='left'>Vector Mode</t><t align='right' color='#3fd4fc'>7</t><br/><br/><t align='left'>Toggle Physics</t><t align='right' color='#3fd4fc'>4</t><br/><t align='left'>Toggle Assistant</t><t align='right' color='#3fd4fc'>5</t><br/><t align='left'>Freeze Object</t><t align='right' color='#3fd4fc'>6</t><br/><t align='left'>Reset Dir/Vector</t><t align='right' color='#3fd4fc'>Ctrl + 7</t><br/><br/><t align='left'>Tilt L/R</t><t align='right' color='#3fd4fc'>Q/E</t><br/><t align='left'>Tilt F/B</t><t align='right' color='#3fd4fc'>PAGE UP/DOWN</t><br/><t align='left'>Distance</t><t align='right' color='#3fd4fc'>HOME/END</t><br/><br/><t align='left'>Larger Steps</t><t align='right' color='#3fd4fc'>SHIFT</t><br/><t align='left'>Smaller Steps</t><t align='right' color='#3fd4fc'>CONTROL</t><br/><br/><t align='left'>Place</t><t align='right' color='#3fd4fc'>SPACE</t><br/><t align='left'>Abort</t><t align='right' color='#3fd4fc'>ESCAPE</t>";
	};
	if (ExileClientConstructionModePhysx) then
	{
		_title = _title + " + PHYSICS";
	};
	_titleControl = _display displayCtrl 1000;
	_titleControl ctrlSetText _title;
	_description = _display displayCtrl 1001;
	_description ctrlShow ExileClientConstructionShowHint;
	if (ctrlShown _description) then
	{
		(_display displayCtrl 1001) ctrlSetStructuredText parseText _structuredText;
	};
	_descriptionBackground = _display displayCtrl 1002;
	_descriptionBackground ctrlShow ExileClientConstructionShowHint;
};
true