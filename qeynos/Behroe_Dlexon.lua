function event_say(e)
  if(e.message:findi("hail")) then
    e.self:QuestSay(e.other,string.format("Ah, greetings, %s!  How are you this evening?  Hopefully, you are faring much better than I..  I'm stuck on the night watch here, and never get to see my lovely [Aenia].  Ah..  she is so sweet..  I wrote her this beautiful [ballad], but I fear she may never hear it.",e.other:GetName()));
  elseif(e.message:findi("aenia")) then
    e.self:QuestSay(e.other,"Aenia lives in North Qeynos in a little blue house near the Temple of Life with her overprotective father.  Last time he caught me there, he nearly killed me!");
  elseif(e.message:findi("ballad")) then
    e.self:QuestSay(e.other,"I wrote this little song for my dearest Aenia, but I can't sing it to her because I'm stuck here on watch duty.  You have a nice voice, "..e.other:GetName()..", maybe you could go and sing my song to her for me, huh?  Just make sure you don't sing to Aenia when her father's around, 'cause like I said, he's already tried to kill me for seeing her.");
    e.other:SummonItem(18026);
  end
end

function event_trade(e)
  local item_lib =require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 18027})) then
    e.self:Say(string.format("Ah, thank you, kind %s.  You've made two foolish lovebirds very happy.  Please, take this..  Though it is not much, it will help keep you warm on those chilly Karana nights.  It is very good to have a friend such as yourself, and I will one day repay you for your kindness and generosity.",e.other:GetName()));
    e.other:SendSound();
    e.other:Faction(192,2,0);
    e.other:Faction(184,2,0);
    e.other:Faction(135,2,0);
    e.other:Faction(273,-2,0);
    e.other:Faction(207,-2,0);
    e.other:AddEXP(250);
  elseif(item_lib.check_turn_in(e.trade, {item1 = 18021})) then
    e.self:Emote(string.format("yawns and says, 'Oh, report time already again?  Yeah, here ya go, %s.  Be careful around here at night, I've been seeing some rough looking characters lurking about.",e.other:GetName()));
    e.other:SendSound();
    e.other:SummonItem(18023);
    e.other:Faction(192,2,0);
    e.other:Faction(184,2,0);
    e.other:Faction(135,2,0);
    e.other:Faction(273,-2,0);
    e.other:Faction(207,-2,0);
    e.other:AddEXP(250);
  end
  item_lib.return_items(e.self, e.other, e.trade, e.text)
end