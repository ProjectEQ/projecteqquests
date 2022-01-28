function event_say(e)
	if(e.other:Class() == "Rogue") then --untested if rogue only, need rejection text otherwise
    
		if(e.message:findi("hail")) then
			e.self:Say("Take a load off and join me for awhile, ".. e.other:GetCleanName() ..".  The Tiger's Roar is the best watering hole in Antonica.  I come here every day to relax and take in the gorgeous view.'  He glances around at the other patrons of the tavern.  'See what I mean?  Like I said... Best bar this side of Norrath.  Now, if you are interested in talking business, I can't help but to assume that you are here because you wish to ingratiate yourself with Stanos and his lot.  It just so happens that I know of several jobs they need taken care of.  If you completed all three, then informed me when you were [done], I imagine it would get you in their good graces.  What will it be, hmm?  [One], [two], or [three]?");
		elseif(e.message:findi("one")) then
			e.self:Emote("holds up a small but ornate urn, 'I have a trinket here that happens to be quite valuable.  As you may have guessed, it was not obtained legally, which in and of itself isn't usually a problem.  However, the previous owner happens to be a wealthy and influential nobleman who happens to have offered a sizable reward for its return.  The reward is even higher should the mercenaries bring back heads of the perpetrators.  Who would have known that the ashes of the old codger's ancestor would mean so much to him?  Now, I'm the type that likes to keep his head on his shoulders.  We need to get rid of this, and soon, but we're not willing to write it off as a loss.  You look like you could play the 'trustworthy' type.  Why don't you buy the urn from me and take it to the Keep Casino?  Trade it in for chips.  Play a few games, cash in early and walk away with the money.  Everybody wins.  Act casual.  Don't give yourself away.");
		elseif(e.message:findi("two")) then
			e.self:Say("Fabulous choice.'  He pauses to light a cigar, taking short puffs of air into his mouth to coax it aflame.  'There's a man that goes by the name of Nichols who was slated to deliver a shipment of Luclinite, ohhh, about two weeks ago.  And when I say deliver I mean smuggle.  He's a reliable type, one of Stanos' best men, so it stands to reason that he's probably been caught and incarcerated.  Right about now, I imagine he's locked up tighter than a sister in the crying seas.  That's just a figure of speech, mind you.  We don't know where he is.  If you could find him and release him, well, that'd be fabulous.'  He takes another long puff and continues. 'Do whatever you have to.");
		elseif(e.message:findi("three")) then
			e.self:Emote("leans in close and whispers, 'You aren't above a bit of smuggling yourself, I hope.  I've got a package that needs to make it to Crow in Qeynos.  The guards are expecting its arrival and have increased their numbers and heightened their watch.  Fortunately for us, they don't know that we know that they know.  On top of that, they'll be expecting someone from the Highpass camp.  Do you understand?  The bottom line is, this shipment must reach Crow in Qeynos, and the deliverer mustn't get caught.  That's all you really need to know.  I'm counting on you to not botch this job, ".. e.other:GetCleanName() .."");

      e.other:SummonItem(9816); -- Item: sealed silver package
		end
	end
end

function event_spawn(e)
	eq.set_timer("timecheck", 30 * 1000);
	eq.set_timer("additem", 1 * 1000);
end

function event_timer(e)
	if (e.timer == "timecheck") then
		local zone_time = eq.get_zone_time();

		if(zone_time["zone_hour"] == 19) then
			--despawn at 7 pm
			eq.depop_with_timer();
		end
	elseif (e.timer == "additem") then
		eq.stop_timer("additem");
		eq.merchant_set_item(407074, 9446, 1); --add 1 gold urn
		eq.merchant_set_item(407074, 52353, 1); --add 1 pouch of gems
	end
end
