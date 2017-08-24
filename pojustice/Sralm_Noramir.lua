----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Sralm Noramir (201000)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("pounces at you, grabbing you by your throat. 'What are you doing here? [" .. eq.say_link("No one sent me",false,"Who sent you") .. "]?'");
    elseif(e.message:findi("No one sent me")) then
        e.self:Emote("eyes gleam. 'I hope you are not here to free a prisoner.  The Tribunal punishes such actions harshly. Once here, there is no hope of escape.  Even for one [" .. eq.say_link("such as you",false,"such as I") .. "].");
    elseif(e.message:findi("such as you")) then
        e.self:Say("Ahh, how rude of me.  Allow me to introduce myself.  I am Sralm Noramir, warrior by birth, [" .. eq.say_link("thief") .. "] by choice.");
    elseif(e.message:findi("thief")) then
        e.self:Say("Aye, I could steal the sword from a warrior's hands or a kiss from a lady's lips.  Ever hear of [" .. eq.say_link("Emperor Sllanar") .. "]?");
    elseif(e.message:findi("Emperor Sllanar")) then
        e.self:Say("He was the ruler of Sebilis, for a short time.  It does not surprise me that you have not heard of him.  His rule was not long, and he did little good or bad for the iksar.  He was, however, quite [" .. eq.say_link("wealthy") .. "].");
    elseif(e.message:findi("wealthy")) then
        e.self:Emote("grins. 'Quite wealthy, indeed.  More money than you could ever imagine, but it was just as much as I could imagine.  I felt that the good Emperor had more wealth than he could possibly ever spend, so I thought it was my duty to [" .. eq.say_link("relieve") .. "] him of some of the excess.");
    elseif(e.message:findi("relieve")) then
        e.self:Say("Yes, and quite a job it was.  He kept all of his accumulated wealth in caves deep below the city.  Though they were well guarded, it was nothing for one such as myself.  I will not bore you with details, but the short of it is I made off with a king's ransom... Literally.  Unfortunately, I was [" .. eq.say_link("caught") .. "].");
    elseif(e.message:findi("caught")) then
        e.self:Emote("sighs, 'It seems the good Emperor was quite paranoid, and took precautions against this contingency.  All of his wealth was enchanted by a tracking spell.  It was silly of me not to look for it.  Stealing was a minor crime in Sebilis, but stealing from the [" .. eq.say_link("Emperor") .. "] was another issue all its own.");
    elseif(e.message:findi("Emperor")) then
        e.self:Say("You see, generally thieves were imprisoned, or at worst executed, but banishment here was usually reserved to those who committed heinous crimes.  I guess you should be careful when you rob the person who gets to decide on the definition of heinous.  Have you any news of [" .. eq.say_link("Sebilis") .. "]?");
    elseif(e.message:findi("Sebilis")) then
        e.self:Say("Sebilis is the city of the Iksar.  The greatest city on all of Kunark, and was my home at one time.  I guess no news is good news.");
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