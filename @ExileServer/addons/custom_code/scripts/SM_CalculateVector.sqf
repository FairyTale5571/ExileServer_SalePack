_aroundX = _this select 0;
_aroundY = _this select 1;
_aroundZ = (360 - (_this select 2)) - 360;

_dirX = 0;
_dirY = 1;
_dirZ = 0;
_upX = 0;
_upY = 0;
_upZ = 1;

if !(_aroundX isEqualTo 0) then 
{
	_sinaroundX = sin _aroundX;
	_cosaroundX = cos _aroundX;
	_dirY = _cosaroundX;
	_dirZ = _sinaroundX;
	_upY = -(_sinaroundX);
	_upZ = _cosaroundX;
};

if !(_aroundY isEqualTo 0) then 
{
	_sinaroundY = sin _aroundY;
	_cosaroundY = cos _aroundY;
	_dirX = _dirZ * _sinaroundY;
	_dirZ = _dirZ * _cosaroundY;
	_upX = _upZ * _sinaroundY;
	_upZ = _upZ * _cosaroundY;
};

if !(_aroundZ isEqualTo 0) then 
{
	_sinaroundZ = sin _aroundZ;
	_cosaroundZ = cos _aroundZ;
	_dirXTemp = _dirX;
	_dirX = (_dirXTemp * _cosaroundZ) - (_dirY * _sinaroundZ);
	_dirY = (_dirY * _cosaroundZ) + (_dirXTemp * _sinaroundZ);
	_upXTemp = _upX;
	_upX = (_upXTemp * _cosaroundZ) - (_upY * _sinaroundZ);
	_upY = (_upY * _cosaroundZ) + (_upXTemp * _sinaroundZ);
};

[[_dirX, _dirY, _dirZ],[_upX, _upY, _upZ]]