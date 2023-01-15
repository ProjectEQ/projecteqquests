-- items: 13114, 18803, 15007
function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Hail!  What do think of [Lisera]?  She aint' much to look at, but soon she will be singing again.");
  elseif(e.message:findi("Lisera")) then
    e.self:Say("Lisera is my lute.  She sounds horrible.  I need to get her tuned by a master tuner, but the League's Master Tuner is in the Plains of Karana for a while.  If only..  hey!!  You look like a fellow bard...  You [interested in the job]?");
  elseif(e.message:findi("interested in the job")) then
    e.self:Say("Great!!  Here.  Take Lisera to Vhalen Nostrolo.  He is in the plains near the well, composing.  He must tune it for me.  Be very careful! Lisera is all I've got.  If you complete this task and return with good news. I shall be glad to pass along an extra songsheet for a tune entitled 'Hymn of Restoration.");
    e.other:SummonItem(13114); -- Lisera Lute
  end
end

function event_trade(e)
  local item_lib = require("items");
  if(item_lib.check_turn_in(e.trade,{item1 = 18803})) then
    e.self:Say("Vhalen does such fine work. I can't wait till he comes back to Qeynos.");
	e.other:SendSound();
    e.other:SummonItem(15007); -- Song: Hymn of Restoration
    e.other:Faction(262,5,0); -- Guards of Qeynos
    e.other:Faction(281,5,0); -- Knights of Truth
    e.other:Faction(284,5,0); -- League of Antonican Bards
    e.other:Faction(230,-10,0); -- Corrupt Qeynos Guards
    e.other:Faction(330,-10,0); -- Freeport Militia
	e.other:AddEXP(100);
  end  
  item_lib.return_items(e.self, e.other, e.trade)
end
