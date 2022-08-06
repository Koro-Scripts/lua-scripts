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
local format = string.format;

rconsolename('Made By Korotbh');
rconsoleclear();

local function Output(Object, Index, Checked)
    Checked = Checked or {};
    if ((typeof(Object) == 'table' or typeof(Object) == 'function') and table.find(Checked, Object)) then return ''; end;
    table.insert(Checked, Object);

    local InnerObjects = {};

    if (typeof(Object) == 'table') then
        for i,v in pairs(Object) do 
            local Accent = typeof(i) == 'number' and '' or "'";
            local Accent2 = (typeof(v) == 'number' or typeof(v) == 'table') and '' or "'";
            table.insert(InnerObjects, format('  %s[%s] -> %s', string.rep(' ', Index * 4), Accent .. tostring(i) .. Accent, Accent2 .. Output(v, Index + 1, Checked) .. Accent2));
        end;
        return format('[\n%s\n%s]\n', table.concat(InnerObjects, '\n', 1, #InnerObjects), Index ~= 1 and string.rep(' ', Index * 4) or '');
    end;
    return format('%s', tostring(Object));
end;

local AlreadyChecked = {};
local function LoopThrough(a1)
    if (table.find(AlreadyChecked, a1)) then return; end;
    table.insert(AlreadyChecked, a1);
    if (typeof(a1) == 'function' and islclosure(a1)) then
        rconsoleprint('@@WHITE@@');
        rconsoleprint('CHECKING: ' .. getinfo(a1, 'n').name .. '\n');
        rconsoleprint('Constants: ' .. Output(getconstants(a1), 1));
        rconsoleprint('@@RED@@');
        rconsoleprint('Upvals: ' .. Output(getupvalues(a1), 1));
        rconsoleprint('@@MAGENTA@@');
        rconsoleprint('Protos: ' .. Output(getprotos(a1), 1));
    elseif (typeof(a1) == 'Instance') then
        rconsoleprint('@@GREEN@@');
        rconsoleprint('Path: ' .. a1:GetFullName() .. '\n');
    elseif (typeof(a1) == 'table') then
        rconsoleprint('@@YELLOW@@');
        rconsoleprint('Table:' .. Output(a1, 1));
    end;
end;

--[[ EXAMPLE SCRIPT:
    local TargetScript = Player.Character.CharacterHandler.InputClient;
    for i,v in pairs(getsenv(TargetScript)) do 
        if (typeof(v) == 'function') then
            LoopThrough(v);
        end;
    end;
]]
