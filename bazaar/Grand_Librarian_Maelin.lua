--poknowledge/Grand_Librarian_Maelin.lua NPCID 202125
-- items: 84091, 84092, 84093, 84087, 52950, 55900, 20520
function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    -- Halloween event
    if(eq.is_task_active(500220) and e.message:findi("trick or treat")) then
        e.self:Say("Ah, here you go. Fresh from the Sugar Assemblage 2000.");
        e.other:SummonItem(eq.ChooseRandom(84091,84092,84093,84087,84087,84087,84087,84087,84087));
        eq.update_task_activity(500220,1,1);
        return;
    end

    -- Quintessence of Elements check
    if(e.other:HasItem(29165) and e.message:findi("hail")) then
        e.self:Say("The Quintessence! Oh my this is amazing! I have come into contact with Chronographer Muon in the realm of innovation. Go to him, show him you have the power to activate machine. I shall meet you there, this I must see!");
        return;
    end

    -- Elemental preflag checks
    if(qglobals["pop_hohb_marr"] == "1" and qglobals["pop_bot_agnarr"] == "1" and qglobals["pop_pon_hedge_jezith"] == "1" and qglobals["pop_pon_construct"] == "1" and qglobals["pop_ponb_terris"] == "1"
        and qglobals["pop_ponb_poxbourne"] == "1" and qglobals["pop_pod_alder_fuirstel"] == "1" and qglobals["pop_pod_grimmus_planar_projection"] == "1" and qglobals["pop_pod_elder_fuirstel"] == "1"
        and qglobals["pop_poj_mavuin"] == "1" and qglobals["pop_poj_tribunal"] == "1" and qglobals["pop_poj_valor_storms"] == "1" and qglobals["pop_pov_aerin_dar"] == "1"
        and qglobals["pop_pos_askr_the_lost"] == "3" and qglobals["pop_pos_askr_the_lost_final"] == "1" and qglobals["pop_cod_preflag"] == "1" and qglobals["pop_cod_bertox"] == "1"
        and qglobals["pop_cod_final"] == "1" and qglobals["pop_pot_shadyglade"] == "1" and qglobals["pop_pot_saryrn"] == "1" and qglobals["pop_pot_saryrn_final"] == "1"
        and qglobals["pop_hoh_faye"] == "1" and qglobals["pop_hoh_trell"] == "1" and qglobals["pop_hoh_garn"] == "1" and qglobals["pop_tactics_ralloz"] == "1") then

        if(e.message:findi("hail")) then
            e.self:Say("Welcome back my friends. I assure you that I have been studying the Cipher of Druzzil very diligently. Did you happen to find any [" .. eq.say_link("lore") .. "] or [" .. eq.say_link("information") .. "]?");
        elseif(e.message:findi("lore")) then
            e.self:Say("‘A parchment of Rallos’? Let me read it...");
        elseif(e.message:findi("information")) then
            e.self:Say("There is no way to escape from the prison that is The Plane of Time...");
            eq.set_global("pop_elemental_grand_librarian","1",5,"F");
            e.other:Message(MT.LightBlue,"You receive a character flag!");
        end
        return;
    end

    -- Shadowknight Epic Dialogue
    if(qglobals["shadowknight_epic"] == "1") then
        if(e.message:findi("tome")) then
            e.self:Say("Yes, I seem to recall having such a tome...");
        elseif(e.message:findi("find an egg")) then
            e.self:Say("I appreciate your help with this! The creature I was supposed to study are most commonly known as murkgliders...");
        end
        return;
    end

    -- Enchanter Epic 1.0
    if(qglobals["ench_epic"] == "2" and e.message:findi("Jeb Lumsed sent me")) then
        e.self:Say("This is from Jeb, you say? I will set my best researchers on it at once...");
        e.other:SummonItem(52950); -- Note to Lobaen
        return;
    end

    -- Default fallback
    if(e.message:findi("hail")) then
        e.self:Say("Greetings traveler. I am quite busy cataloging the knowledge of the planes. Have you come to speak of planar [" .. eq.say_link("lore") .. "] or perhaps [" .. eq.say_link("tasks") .. "]?");
    end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.other);
    local item_lib = require("items");

    if(qglobals["shadowknight_epic"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 55900})) then
        e.self:Say("I knew they were egg-layers! Ha, this is one gnome who hates losing a bet...");
        e.other:SummonItem(20520);
        return;
    end

    item_lib.return_items(e.self, e.other, e.trade);
end
