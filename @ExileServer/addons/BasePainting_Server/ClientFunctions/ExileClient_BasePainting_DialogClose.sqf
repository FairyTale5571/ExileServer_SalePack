/*
* 	Name: ExileClient_BasePainting_DialogClose.sqf
* 	Author(s): Shix
* 	Description: Close the dialog and destroy the model box and camera ... ok ok i dont know why 2 lines need a file ... but shh pleb
*/
call ExileClient_gui_modelBox_destroy;
[BasePaintingSearchThread] call ExileClient_system_thread_removeTask;
(findDisplay 7688) closeDisplay 0;
