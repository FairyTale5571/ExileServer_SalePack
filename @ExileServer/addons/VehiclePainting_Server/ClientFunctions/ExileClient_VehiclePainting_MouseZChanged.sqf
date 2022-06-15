if (_this select 1 > 0) then
{
    if (VehiclePianting_CurrentZoom > 0.3) then {
        VehiclePianting_CurrentZoom = VehiclePianting_CurrentZoom - 0.1;
    };
}
else
{
    if (VehiclePianting_CurrentZoom < 1.5) then {
        VehiclePianting_CurrentZoom = VehiclePianting_CurrentZoom + 0.1;
    };
};
ExileClientModelBoxCamera camSetFov VehiclePianting_CurrentZoom;
ExileClientModelBoxCamera camCommit 0.1;
