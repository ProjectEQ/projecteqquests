----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Rhionn Leafsblade (201293)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("raises his head from his hands, it appears he was weeping. 'Murderer! I am a [" .. eq.say_link("murderer") .. "].'");
    elseif(e.message:findi("murderer")) then
        e.self:Emote("sighs heavily, wiping his face with his sleeve. 'I am a ranger as I am sure you could have guessed.  I spent my entire life serving Karana, I was a loyal husband, I loved my [" .. eq.say_link("wife") .. "] with all of my heart.'");
    elseif(e.message:findi("wife")) then
        e.self:Say("My wife was beautiful, a wonder to behold.  A friend came to me one day to tell me that my wife was killed by a band of ruffians.  I was heartbroken and blind from rage.  The bandit leader, I was told, was a man by the name of Filland Rallis.  I knew [" .. eq.say_link("Filland") .. "], he was once a noble paladin, but he fell from his God's graces.");
    elseif(e.message:findi("Filland")) then
        e.self:Say("Filland never lost his honor, I'm not sure what action he performed to fall, but he had never committed an ignoble act.  I was shocked that he would take to murder; all of his crimes were stealing from those who had excess, and giving to those that were needy.  He was a [" .. eq.say_link("hero") .. "] to many of us.");
    elseif(e.message:findi("hero")) then
        e.self:Say("Yes, I have heard bards even still sing of his laurels.  He was renowned for his skill with a blade, and his mithril armor was legendary, and heirloom of his family name.  Without investigation or research I assumed that the rumors of my wife's death were accurate and I set to [" .. eq.say_link("slay her killer") .. "].");
    elseif(e.message:findi("slay her killer")) then
        e.self:Say("It was to be no easy task.  I was no match for him in close quarters, there were few that were when he held a sword in his hands.  I knew that he would be no match for my bowmanship.  So I went to a friend, a [" .. eq.say_link("centaur") .. "] I had done much business with, and had him make a magical arrow, one capable of piercing Filland's armor.");
    elseif(e.message:findi("centaur")) then
        e.self:Say("Shaldyn Thunderhoof, the greatest fletcher Norrath has ever known.  He sent me far and wide to collect components for the arrow.  When I returned he assembled it for me.  I never let him know what the arrow was to be used for, I felt better not to burden him with my sorrows.  Then I set out to kill Filland");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    e.self:Emote("cries out, 'Guards!  Guards!");
end

function event_death_complete(e)
    e.self:Say('Justice comes to all, in time.');
end