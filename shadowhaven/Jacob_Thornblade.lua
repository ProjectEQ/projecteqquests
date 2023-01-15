-- items: 66615
local prizes = {
    11668,      -- Vibrating Gauntlets of Infuse
    59509,      -- Glowing Black Drum
    24890,      -- Holgresh Elder Beads
    2469,       -- Guise of the Deceiver
    10895,      -- Fungus Covered Great Staff
    59504,      -- Glowing White Drum
    4164,       -- Rubicite Breastplate
    11604,      -- Scimitar of the Mistwalker
    6631,       -- Ton Po's Bo Stick of Understanding
    5667        -- Earthshaker
};

function event_say(e)
    if (e.message:findi("hail")) then
        e.self:Say("Welcome! Welcome to Shandeling's, the gaming hall of chance! The game room is downstairs. If you are lucky enough to get a Gold Ticket, be sure to bring it to me for a spin on the big wheel of prizes! Make sure to tip your waitress well!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if (item_lib.check_turn_in(e.trade, {item1 = 66615})) then -- Gold Ticket
        local valid_prizes = { };
        for k, v in pairs(prizes) do
            if (not e.other:HasItem(v, e.trade) and not (v == 2469 and e.other:GetBaseRace() == 6)) then -- dark elf can't get mask
                valid_prizes[#valid_prizes + 1] = v;
            end
        end

        if (#valid_prizes == 0) then
            e.self:Say("I am sorry, but at the moment our great wheel of prizes is not spinning! Could you try again in a few moments while I try to fix the jam? Thanks!");
            e.other:SummonItem(66615); -- Item: Gold Ticket
        else
            e.self:Shout("Ladies and Gentlemen gather around, as our brave " .. e.other:GetName() .. " is turning in their Golden Ticket for a chance at the big time! With a spin of the wheel let us determine the prize. Ladies and gentlemen, the " .. e.other:Race() .. " wins a prize! Everyone please congratulate " .. e.other:GetName() .. " on this excellent luck!");
            local which = math.random(1, table.getn(valid_prizes));
            e.other:SummonItem(valid_prizes[which]);
        end
    end
    item_lib.return_items(e.self, e.other, e.trade);
end

