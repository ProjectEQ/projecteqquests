function event_say(e) 
	local instance_requests = require("instance_requests");
	local lockout_globals = {
      { "Tacvi_PXK", "Tacvi: Pixtt Xxeric Kex" },
      { "Tacvi_PKK", "Tacvi: Pixtt Kretv Krakxt" },
      { "Tacvi_PRT", "Tacvi: Pixtt Riel Tavas" },
      { "Tacvi_ZMKP", "Tacvi: Zun`Muram Kvxe Pirik" },
      { "Tacvi_ZMSB", "Tacvi: Zun`Muram Shaldn Boc" },
      { "Tacvi_ZMMD", "Tacvi: Zun`Muram Mordl Delt" },
      { "Tacvi_ZMYV", "Tacvi: Zun`Muram Yihst Vor" },   
      { "Tacvi_TMCV", "Tacvi: Tunat`Muram Cuu Vauax" }
		}

  if (e.message:findi("lockouts")) then
		instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
  elseif (e.message:findi("hail")) then
    if (e.other:HasItem(64034)) then 
      --#if have signet of command
			e.self:Say("You hold a Signet of Command! I can use the power of the signet to [" .. eq.say_link("open the way") .. "] for you to the upper reaches of the temple once you are prepared to face the Tunat'Muram.");
    else
      --#if don't have signet of command		
			e.self:Say("Aaaaahh! You frightened me! I've spent days hiding in the rubble here waiting for someone to come. Thank Trushar it's you and not one of those monsters! I didn't know how much longer I could hold out, but I have information that may [" .. eq.say_link("help") .. "] you rid our island of those vile Muramites and help me get out of this cursed place.");
    end
  elseif (e.message:findi("help")) then
		e.self:Say("I know the monster that guards this place. He calls himself [" .. eq.say_link("Tkarish") .. "]. I was held captive by the two-headed beast. I don't know exactly what fate awaited me, but the cries of my fellow prisoners were enough to know that it wouldn't have been pleasant.");
  elseif (e.message:findi("Tkarish")) then
		e.self:Say("I believe the full title he demanded his servants use is Zun'Muram Tkarish Zyk. Fortunately, he's as arrogant as he is strong and I was able to slip away when he thought me secure. Unfortunately, he has gained control over the sacred [" .. eq.say_link("constructs") .. "] in the temple so I haven't been able to leave.");
  elseif (e.message:findi("constructs")) then
		e.self:Say("There are special constructs within this temple that allow access to other areas. The one next to us would normally allow me to leave the temple entirely, but it is under the sway of the Muramites. I overheard Tkarish speaking of a Tunat'Muram, a kind of commander as far as I could tell, that resides within the upper levels of the temple only reachable via the constructs. But Tkarish holds a [" .. eq.say_link("Signet of Command") .. "] which gives him control over the constructs. As long as he has that Signet, the way to the Tunat'Muram is closed to you and the way out is closed to me.");
  elseif (e.message:findi("signet of command")) then
		e.self:Say("If you can wrest the signet from Tkarish's grasp, the constructs will allow you passage to the upper levels of the temple. Should you claim a Signet of Command for yourself, I can use it to activate a nearby construct. From here, the influence of your signet would be stronger than the one Tkarish wields in the chapel above and I should be able to convince the construct to grant you passage to the upper levels of the temple.");
  elseif (e.message:findi("open the way")) then
    if (e.other:HasItem(64034)) then 
      --#if have signet of command
      --#create tacvi instance
      local request = instance_requests.ValidateRaidRequest("tacvi", 0, 6, 54, 65, {}, e.other, lockout_globals);
      -- Only check request.valid here; because when you zone in; the status will calculate which mobs
      -- are active as each mob has its own lockout.
      if (request.valid) then 
        local instance_id = eq.create_instance("tacvi", 0, 21600);              
        eq.set_global(instance_id.."_tacvi_bit",tostring(request.flags),7,"H6");
        eq.assign_raid_to_instance(instance_id);                                  
        e.self:Say("So be it. There is a construct nearby that will bring you to the seat of the slayer himself. May Trushar's blessing infuse your swords with the strength to cleanse this place of the Muramite invaders!");
      else
      --#if have signet but not in raid/not have enough
        e.self:Say("I cannot in good conscience allow you into the upper temple as you are.  If you wish to have any chance against the forces of the Tunat'Muram, you will need the help of many friends.  Without them, I would just be sending you to be slaughtered.");
      end
    end
  end

end
