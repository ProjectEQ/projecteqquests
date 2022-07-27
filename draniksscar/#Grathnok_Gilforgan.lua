-- items: 15825
function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    if (qglobals["wiz_epic20"] ~= nil and qglobals["wiz_epic20"] >= "1") then
        if (e.message:findi("globe of pure discordant energy")) then
            e.self:Say("I know about the globes of which you speak and perhaps may even be able to aid you in obtaining one. First, though, I have to ask a favor of you. My people have suffered tireless ages here in Discord, protecting the portal. If we lose our hold on the portal the armies of discord would be able to overrun our home world, much like what has started to happen on your home world of Norrath.");
        elseif (e.message:findi("Lose your hold")) then
            e.self:Say("It is still too early to tell... We are well established here, but the constant attacks and dreary landscape really take their toll on young minds. Adding to that, when an attack is successful it bears heavy in the minds of my people. In a recent attack, a surprise raid upon our encampments, the precious Intricate Horn of Galien was taken. The purpose for this atrocity is as of yet unknown, however this item holds great meaning to us and the favor I ask is simply to return this sacred artifact to me.");
        elseif (e.message:findi("Intricate Horn of Galien")) then
            e.self:Say("This precious artifact was placed on our largest tower, where its resonating voice stretched across the planes and through the mountains to rally our troops and warn us of an impending attack. The horn has tremendous sentimental value for us, as it belonged to one of the great leaders of our past. It is a horn made of the finest precious metals of our homeland, laden with runes and etchings and filled with gems and precious stones. It is a signification of our strength and perseverance over the ages and without it the morale is very low amongst our soldiers.");
            if (qglobals["wiz_epic20"] == "1") then
                eq.set_global("wiz_epic20", "2", 5, "F"); -- flagged to loot
            end
        end
    end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.other);
    local item_lib = require("items");

    if (qglobals["wiz_epic20"] ~= nil and qglobals["wiz_epic20"] >= "2") then
        if (item_lib.check_turn_in(e.trade, {item1 = 15825})) then
            e.self:Say("Your resolve and strength of will astounds me. You have returned to my people, the most sacred artifact we have on this world, and for that, you have earned my gratitude. As promised, I will give you the information that I have on the discordant globes. These globes can only be collected in one area, where the magic of discord constantly fluxes and an eerie sense of pain and anguish resides. Beware, it is an extremely dangerous area, protected by many of the Muramite Army's best and highest ranking members. Good luck to you, I hope you achieve all that you aspire.");
            if (qglobals["wiz_epic20"] == "2") then
                eq.set_global("wiz_epic20", "3", 5, "F"); -- flagged to turn in globe
            end
        end
    end

    item_lib.return_items(e.self, e.other, e.trade);
end
