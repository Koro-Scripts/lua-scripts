local Player = game:GetService('Players').LocalPlayer;

local getconstants = debug.getconstants;
local getconstant = debug.getconstant;
local setconstant = debug.setconstant;
local setupvalue = debug.setupvalue;
local getupvalues = debug.getupvalues;
local getupvalue = debug.getupvalue;
local getprotos = debug.getprotos;
local getproto = debug.getproto;
local getinfo = debug.getinfo;

local TargetScript = Player.Character.CharacterHandler.InputClient;
local TargetFunction = nil; --set to nil to avoid checking

rconsolename('Made By Korotbh');
rconsoleclear();

local function OutputInformation(Type, Message)
    if (Type == 'Constant') then
        rconsoleprint('@@BLUE@@');
        rconsoleprint('    Constant: ' .. Message .. '\n');
    elseif (Type == 'Upvalue') then
        rconsoleprint('@@RED@@');
        rconsoleprint('    Upvalue: ' .. Message .. '\n');
    elseif (Type == 'Proto') then
        rconsoleprint('@@MAGENTA@@');
        rconsoleprint('    Proto: ' .. Message .. '\n');
    end;
end;

local function OutputConstants(Func)
    for i,v in pairs(getconstants(Func)) do 
        OutputInformation('Constant', tostring(v));
    end;
end;

local function OutputUpvalues(Func)
    for i,v in pairs(getupvalues(Func)) do 
        OutputInformation('Upvalue', tostring(v));
    end;
end;

local function OutputProtos(Func)
    for i,v in pairs(getprotos(Func)) do 
        OutputInformation('Proto', tostring(v));
    end;
end;

for i,v in pairs(getsenv(TargetScript)) do 
    if (typeof(v) == 'function' and islclosure(v)) then 
        rconsoleprint('@@WHITE@@');
        rconsoleprint('Checking Function: ' .. getinfo(v).name .. '\n');
        OutputConstants(v);
        OutputUpvalues(v);
        OutputProtos(v);
    end;
end;

if (TargetFunction ~= nil and typeof(TargetFunction) == 'function' and islclosure(TargetFunction)) then
    rconsoleprint('@@WHITE@@');
    rconsoleprint('Checking Function: ' .. getinfo(TargetFunction).name .. '\n');
    OutputConstants(TargetFunction);
    OutputUpvalues(TargetFunction);
    OutputProtos(TargetFunction);
end;
