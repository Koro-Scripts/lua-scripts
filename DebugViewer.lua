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

rconsolename('Made By Korotbh');
rconsoleclear();

local AlreadyChecked = {};

local function LoopThrough(a1)
    if (typeof(a1) == 'number' or typeof(a1) == 'string') then return; end;
    if (table.find(AlreadyChecked, a1)) then return; end;
    table.insert(AlreadyChecked, a1);
    if (typeof(a1) == 'function' and islclosure(a1)) then 
        rconsoleprint('@@WHITE@@');
        rconsoleprint('CHECKING: ' .. getinfo(a1).name .. '\n');
        for i,v in pairs(getconstants(a1)) do 
            rconsoleprint('@@BLUE@@');
            rconsoleprint('    Constant: ' .. tostring(v) .. '\n');
        end;
        for i,v in pairs(getupvalues(a1)) do 
            rconsoleprint('@@RED@@');
            rconsoleprint('    Upvalue: ' .. tostring(v) .. '\n');
            LoopThrough(v);
        end;
        for i,v in pairs(getprotos(a1)) do 
            rconsoleprint('@@MAGENTA@@');
            rconsoleprint('    Proto: ' .. tostring(a1) .. ' ' .. getinfo(a1).name .. '\n');
            LoopThrough(v);
        end;
    end;
    if (typeof(a1) == 'table') then
        for i,v in pairs(a1) do 
            LoopThrough(v);
        end;
    end;
end;

for i,v in pairs(getsenv(TargetScript)) do 
    LoopThrough(v);
end;
