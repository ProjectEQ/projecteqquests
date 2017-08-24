----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Xin Renthais Ishan (201394)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 16 and e.other:GetLanguageSkill(16) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Combine Tongue, 'Ah!'  He paces back and forth.  'Lumanes, ".. e.other:GetName() .. ".  Ah, you are sivuela, I shall use your mortal tongue.'  Two of his hands hold his belt whilst the other two wring one another in thought.  'These are tavuelais tianeus...  [painful days] indeed.'");
        elseif(e.message:findi("painful days")) then
            e.self:Say("in Combine Tongue, 'My spies have received word that the Stormbringer is to the sacred city headed.  Gah!'  He spits upon the floor.   'I am vexed, for I have not the ability to reach there and provide warning.  My [lytaer] took me far.");
        elseif(e.message:findi("lytaer")) then
            e.self:Say("in Combine Tongue, 'Then again, my duty has always taken me far.  My duty is that which no other will perform, that which no other can perform.  To the phaluim I go.'  He spits again.  'To the infestation, to the mortal dwelling.  I have learned their tongue through much observation, this is in itself crime punishable by [attaumis].");
        elseif(e.message:findi("attaumis")) then
            e.self:Say("in Combine Tongue, 'Kra!'  He flinches.  'Forgive me, it is...  the end of the soul.  Not simple tekar, not the death of the body.'  He taps between his eyes with one hand.  'It is the death of the spirit, separation from Ishinae herself, with no way of returning.  I take this fate willingly, for in my eternal suffering I know that, despite consort with the siveulaeus... the mortals... my [information] will save us.'");
        elseif(e.message:findi("information")) then
            e.self:Say("in Combine Tongue, 'I am a Leader of Wars by title.  However, my calling is of a gatherer of temariel...  He struggles for the right word.  'A gatherer of knowledge.  I do this by watching and even talking with those siveula whom can be trusted.  Though this is crime punishable by death, my death is worth serving my kind as I have.  Though I fear that this time it is [too late].");
        elseif(e.message:findi("too late")) then
            e.self:Say("in Combine Tongue, 'Whilst concealed with my spies outside of the tek phaluim, the... Silver Infestation, watching them crawl through their pestilential lives, word of the Stormbringer came to me.  I have to warn the rentha...  to the city...   yet, I was too far.  Now, I am even further.'  He sighs.  'With me, the warning will die.  I cannot tell what xetanus will occur...' He struggles again.  'What blasphemy will occur when the Stormbringer reaches the rentha.  Here I sit, unable to act.  Awaiting [xiall].'");
        elseif(e.message:findi("xiall")) then
            e.self:Say("in Combine Tongue, 'Justice, it comes to us all in the end.  I shall pay for my crime, for being so close to the dutenus...  the enemy.  Mine is damnation eternal.  Linger not with me, for I must be alone, I have much to think upon.  Farewell, ".. e.other:GetName() .. "...   vyanemis.");
        end
    else
        e.self:Emote('does not appear to understand you.');
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