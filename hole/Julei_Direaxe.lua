-- items: 17200
local ignoreplayer=0;
local ignoresay=0;

function event_say(e)
  local qglobals = eq.get_qglobals(e.other);
  if (qglobals["berserk_epic"] == "8" and e.message:findi("hail") and ignoresay == 0) then
    if ignoreplayer == 0 then
      e.self:DoAnim(27);
      e.self:Emote("ignores you and continues to move forward");
      e.self:MoveTo(-174.5, 497.5, -235.5, 64, true);
      eq.set_timer("warp", 10000);
      ignoreplayer = 1;
      ignoresay = 1;
    else
      e.other:SummonItem(17200); --Julei's Twilight Pendant
      e.self:Say("Here take this back to Keras. This should be proof enough that I am fine. My thanks to you berserker. May you honor the path.");
      ignoreplayer = 0;
      ignoresay = 0;
    end
  elseif (qglobals["berserk_epic"] == nil and qglobals["berserk_epic_pre"] == nil) then -- Berserker Pre-1.5 Epic
    if (e.message:findi("hail")) then
      e.self:Say("I do not have time to talk now, I am on a task of the utmost urgency! I must strike now while this rage boils within me!");
      eq.set_global("berserker_epic_pre", "1", 5, "F"); -- Start pre 1.5 epic
      -- Initiate dungeon walk
    end
  elseif (qglobals["berserk_epic_pre" == "2") then -- Dungeon walk complete
    if (e.message:findi("wake the spirit of rage")) then
      e.self:Say("You must call upon your strength of will to learn how to fully wake the spirit of rage that dwells deep within you. In order to begin the process of focusing and ultimately learning to control your rage, you must let it flow fully and unbridled. To accomplish this, you must go out in search of a long-standing enemy, confront them face to face, and do not hold back the fury that will well up inside you.");
    elseif (e.message:findi("long-standing enemy")) then
      e.self:Say("I cannot tell you who your enemies are, but I will leave you with this useful bit of information. Search deep within yourself, find someone who has wronged you in the past, someone who you have not forgotten nor forgiven of past transgressions. Perhaps it was a city guard that forced you out of a city prematurely, or a merchant who wouldn't sell you some goods because he didn't like you, it is a member of the leadership of your own town. Only you know the answer to this.");
      eq.set_global("berserk_epic_pre", "3", 5, "F"); -- Ready for "enemy"
    end
  end
end

function event_timer(e)
  if e.timer == "warp" then
    eq.stop_timer("warp");
    e.self:GMMove(211, 832, -893, 0);
    e.self:MoveTo(211, 832, -893, 0, true);
    eq.set_timer("warpback", 5*60*1000);
  elseif e.timer == "warpback" then
    eq.stop_timer("warpback");
    e.self:GMMove(-174.5, 497.5, -235.5, 384);
    e.self:MoveTo(-233.7, 486, -219.3, 29, true);
    ignoresay = 0;
  end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Text for dungeon walk
  -- e.self:Emote("sits down and rests a bit, 'It's a good thing you came by, that might have been disasterous.'");
  -- e.self:Emote("lunges at you fiercely, stopping a hair's breadth from your shoulder. 'You might want to learn not to disturb someone in the heat of battle like that; it could prove to be a mistake someday. Are you here to learn how to wake the spirit of rage that lies dormant within you?'");

