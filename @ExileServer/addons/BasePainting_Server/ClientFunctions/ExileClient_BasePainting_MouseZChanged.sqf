if (_this select 1 > 0) then
{
    if (BasePianting_CurrentZoom > 0.3) then {
        BasePianting_CurrentZoom = BasePianting_CurrentZoom - 0.1;
    };
}
else
{
    if (BasePianting_CurrentZoom < 1.5) then {
        BasePianting_CurrentZoom = BasePianting_CurrentZoom + 0.1;
    };
};
ExileClientModelBoxCamera camSetFov BasePianting_CurrentZoom; ExileClientModelBoxCamera camCommit 0.1;
