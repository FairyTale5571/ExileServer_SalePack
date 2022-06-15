switch (_this) do
{
	case "Drag":
	{
		player playMoveNow "AcinPknlMstpSrasWrflDnon";
		ExileClientInteractionObject attachTo [player, [0, 1.1, 0.092]];
		ExileClientInteractionObject setVariable["IsBeingDragged",true,true];
		ExileClientDraggedPlayer = ExileClientInteractionObject;
		ExileClientPlayerIsDragging = true;
		_code =
		{
			_animation = animationState player;
			if!((_animation isEqualTo "acinpknlmstpsraswrfldnon") || _animation isEqualTo "acinpknlmwlksraswrfldb") then
			{
				player playMoveNow "AcinPknlMstpSrasWrflDnon";
			};
			if!(alive player) then
			{
				"End" call XG_DragPlayer;
			};
			if!(alive ExileClientDraggedPlayer) then
			{
				"End" call XG_DragPlayer;
			};
			if!((vehicle player) isEqualTo player) then
			{
				player action["Eject", (vehicle player)];
			};
		};
		ExileClientDraggingThreadID = [0.1,_code,[],true] call ExileClient_system_thread_addtask;
		call ExileClient_gui_interactionMenu_unhook;
	};
	case "End":
	{
		try
		{
			if((count(nearestObjects [(getpos ExileClientDraggedPlayer),["Exile_Construction_Abstract_Static","House"],3])) != 0) then
			{
				throw "Are you trying to glitch?";
			};
			if!(ExileClientDraggedPlayer getVariable["IsBeingDragged",false]) then
			{
				throw "The target is not being dragged!";
			};
			player playMove "AmovPknlMstpSrasWrflDnon";
			detach ExileClientDraggedPlayer;
			ExileClientDraggedPlayer setVariable["IsBeingDragged",false,true];
			ExileClientPlayerIsDragging = false;
			[ExileClientDraggingThreadID] call ExileClient_system_thread_removeTask;
			call ExileClient_gui_interactionMenu_unhook;
		}
		catch
		{	
			["ErrorTitleOnly", [_exception]] call ExileClient_gui_toaster_addTemplateToast;
		};
	}; 	
};