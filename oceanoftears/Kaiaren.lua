-- items: 48127, 48119, 48120, 48129, 48130
local char_id = 0;
local spawn_chest = false;
local update_global = false;

function event_spawn(e)
    char_id = 0;
    spawn_chest = false;
    update_global = false;
end

function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    -- 1.5 done
    if (qglobals["monk_epic"] == "9") then
        if (e.message:findi("hail")) then
            e.self:Say("Hello, " .. e.other:GetName() .. ", I have been [" .. eq.say_link("expecting") .. "] you.");
        elseif (e.message:findi("expecting")) then
            e.self:Say("There is still much that needs to be done and I lack the strength still to continue it myself. If you choose to you can first begin by completing a [" .. eq.say_link("simple task") .. "] for me.");
        elseif (e.message:findi("simple task")) then
            e.self:Say("I need you to gather some rare [I need you to gather some rare [" .. eq.say_link("delicacies") .. "] and bring them back to me. This meal has been passed down the Order for ages. This meal is said to grant strength back to the feeble. It is the only way possible for us to combat this [" .. eq.say_link("menace") .. "].");
        elseif (e.message:findi("delicacies")) then
            e.self:Say("I will need to you to gather some [" .. eq.say_link("sunless nectar") .. "] and some meat from and some meat from an [" .. eq.say_link("ancient creature") .. "].");
        elseif (e.message:findi("menace")) then
            e.self:Say("What menace? For sure Vortix has mentioned to you his dreams? His dreams provide a rare gift of forsight into what lies ahead. There is a dark threat that looms over the Order's head like a vice. It wants nothing more than to destroy all that know of it's existence.");
            if (qglobals['mnk_epic20'] == nil) then
              eq.set_global("mnk_epic20", "1", 5, "F");
            end
        elseif (e.message:findi("sunless nectar")) then
            e.self:Say("The sunless nectar comes from the darkest parts of Norrath. Once you find it you must combine it with some spices and a pie tin to make a Sugar and Spice Nectar Pie. Please return soon after you have both items.");
        elseif (e.message:findi("ancient creature")) then
            e.self:Say("The creature you seek has been living for as long as any can remember. It can be found surrounded by water. You will need to take it's meat and combine it with grilling sauce, a loaf of bread, and some cheese to make a Grilled Aged Meat and Cheese Sandwich. Please return soon after you have both items.");
        elseif (qglobals["mnk_epic20"] ~= nil) then
            if (e.message:findi("choose to continue") and qglobals["mnk_epic20"] >= "2") then
                e.self:Say("As I thought you would; you will find them as you did the others, in their natural essence. You will find the Disciple of Focus in the hills and mountains training diligently. The Disciple of Tranquility you shall find in a clearing where many do not travel without knowing valor and courage. It is there that you will be able to find your calmness. Please return to me when you have gained their respect as well as their symbols. I will also require your sash.");
                -- bug fix, missing sash and on this exact step!
                if (not e.other:HasItem(48127) and qglobals["mnk_epic20"] == "2") then
                    e.other:SummonItem(48127); -- Item: Initiate's Sash of the Celestial Order
                end
                eq.set_global("mnk_epic20", "3", 5, "F"); -- can activate Disciples now
            elseif (e.message:findi("final task") and qglobals["mnk_epic20"] >= "4") then
                e.self:Say("Yes, you must combat an enlightened one. It is our way that balance must be kept. Without good, evil cannot exist. We are but a small part in the cycle of true immortality. If you are [" .. eq.say_link("ready to begin") .. "] I will battle you. Please do not worry, if you defeat me, my being will continue to exist within you as that is the way of our Order. If you fall however, it was meant to be.");
            elseif (e.message:findi("ready to begin") and qglobals["mnk_epic20"] >= "4") then
                e.self:Say("Stand fast and ready to prove your worth now " .. e.other:GetName() .. "!");
                e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
                e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
                char_id = e.other:CharacterID();
                eq.attack(e.other:GetName());
                if (qglobals["mnk20_oot_chest"] == nil) then
                    spawn_chest = true;
                end

                if (qglobals["mnk_epic20"] == "4") then
                    update_global = true;
                end
            end
        end
    end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.other);
    local item_lib = require("items");

    if (qglobals["mnk_epic20"] ~= nil and qglobals["mnk_epic20"] >= "1") then
        if (item_lib.check_turn_in(e.trade, {item1 = 48119, item2 = 48120})) then -- Sugar and Spice Nectar Pie and Aged Meat and Cheese Sandwich
            e.self:Say("Ah, thank you. These will help me greatly but I am afraid I will still lack the strength needed to combat this evil. You will have to go in my place until at least I have had a little longer to rest and train. If you [" .. eq.say_link("choose to continue") .. "], there are two more Disciples that you must face in order to reach the point of transcendence.");
            e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1000); -- adjust EXP
            eq.set_global("mnk_epic20", "2", 5, "F"); -- flags to continue dialog
        elseif (qglobals["mnk_epic20"] >= "3" and item_lib.check_turn_in(e.trade, {item1 = 48129, item2 = 48130, item3 = 48127})) then -- Polished Symbol of Focus, Polished Symbol of Tranquility, Initiate's Sash of the Celestial Order
            e.self:Say("I see you are ready to assume the [" .. eq.say_link("final task") .. "] before facing the Dark Foe that will forever change our way of life here.");
            e.other:QuestReward(e.self, 0, 0, 0, 0, 0, 1000); -- adjust EXP
            eq.set_global("mnk_epic20", "4", 5, "F"); -- flags to continue dialog
        end
    end

    item_lib.return_items(e.self, e.other, e.trade);
end

function event_combat(e)
    if (e.joined == false) then
        eq.stop_all_timers();
        eq.set_timer("reset", 900000); -- 15 mins
    end
end

function event_timer(e)
    if (e.timer == "reset") then
        e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
        e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
        char_id = 0;
        spawn_chest = false;
        update_global = false;
    end
end

function event_death_complete(e)
    local entity_list = eq.get_entity_list();
    -- if someone comes along before he resets, I guess you get the globals set ... oh well
    if (spawn_chest) then
        eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- a chest (epic 2.0)
        eq.target_global("mnk20_oot_chest", "1", "F", 0, char_id, 0);
    end
    if (update_global) then
        eq.target_global("mnk_epic20", "5", "F", 0, char_id, 0);
    end
    char_id = 0;
    spawn_chest = false;
    update_global = false;
end

