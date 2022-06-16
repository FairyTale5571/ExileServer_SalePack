// Select names for AI based on the side
_side	    = _this select 0;
_firstName  = "Tyler";
_lastName   = "Durden";

if(SC_useRealNames) then
{
    switch (_side) do 
    {
        case "survivor":
        {
            _firstName  = selectRandom SC_SurvivorFirstNames; 
            _lastName   = selectRandom SC_SurvivorLastNames;
        };
        case "bandit":
        {
            _firstName  = selectRandom SC_BanditFirstNames;
            _lastName   = selectRandom SC_BanditLastNames;
        };
    };
    _name = format["%1 %2",_firstName,_lastName];
    _name    
};