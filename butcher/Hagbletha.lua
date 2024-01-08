--Frostfell A Gift for Tinam (#4) -- TODO Update Task ID's

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("What you want! Me busy sitting here!");
	elseif e.message:findi("hair") then
        if e.other:IsTaskActive(4) then
            e.self:Say("Silly Dwarf! He comes to ruins sometimes and tries to talk! HA! Someday I eat him! For now though we play! I need you [bring] me something.");
        end
    elseif e.message:findi("bring") then
        if e.other:IsTaskActive(4) then
            e.self:Say("Der is a barbarian at docks here, his name is Firin. Go to docks, take skin off barbarians back, return skin to me, I give you hair from head!");
        end
    end
end

function event_trade(e)
    local item_lib = require("items");
    if e.other:IsTaskActivityActive(4,7) then -- Frostfell A Gift for Tinam (#4) Activity ID 7 active
        if item_lib.check_turn_in(e.trade, {item1 = 87543}) then -- Firin's Bear Skin Cloak
			e.self:Say("'I wanted barbarian skin, but dis will do. Here, take these.' Hagbletha plucks three hairs from a giant mole on her nose and hands them to " .. e.other:GetName() .. ". 'Give dem to the dorf so he stop coming by here.'")
			e.other:UpdateTaskActivity(4,7,1); -- Frostfell A Gift for Tinam (#4) Activity ID 7 complete
            e.other:SummonItem(87542); -- Lock of Hagbletha's Hair
		end
    end
    item_lib.return_items(e.self, e.other, e.trade);
end