-- # Khati Sha Event
-- # Created by Gonner
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Thank you for coming. I am not sure what brought you here but I am glad that you have arrived. Andro and I came here as part of a raiding party. Our entire party was captured, all except Andro and I died. In the time we have been here, we have learned of 3 [seals] which protect the inner chambers.");
	elseif(e.message:findi("seals")) then
		e.self:Say("Interesting, from what we can tell each of the 3 seals embodies one of the principles with which the grimlings were created, Life, Death, and Spirit. Each of the seals has been enclosed in a Warder whose very existence is tied to the seal. Destroy the [Warder] and the seal falls with it.");
	elseif(e.message:findi("warder")) then
		e.self:Say("We have discovered that the Life Ward exists inside this chamber, while the Death Ward exists in a chamber above. The spirit ward is hidden somewhere deeper; we can sense its presence, but cannot find its exact location. We suspect that you cannot reach it with the life and death wards still whole. We fear that the [situation] may be complicated even further.");
	elseif(e.message:findi("situation")) then
		e.self:Say("The Wards are a by-product of the magic that was used to create the grimlings, there is symmetry between them. We have managed a [spell] that will destroy the magic hiding two of the Wards, the Life Ward and the Death Ward. Starting the spell will cause both to manifest, however the magic protecting the Life Ward will not fall completely until we have completed our spell.");
	elseif(e.message:findi("spell")) then
		e.self:Say("The spell will use our own life force to break the life ward's shields, we will die shortly after we begin casting, if we do not complete [casting] our spell. Even if we do our life force is tied to that of the Wards, we will die shortly after completion if either Life, or Death Wards still live.");
	elseif(e.message:findi("casting")) then
		e.self:Say("There is one more thing I should mention... While we were perfecting the spell, whenever we would get close the life ward would summon grimlings to disrupt our chants. We are not able to concentrate or focus with them present. You will have to make sure they are not around to stop our magic, and do not forget that the death and spirit wards will resurrect the life ward if one or the other isn't destroyed shortly after it falls. Let me know when you are [ready] for us to [begin our spell.]");
	elseif(e.message:findi("ready")) then -- ready for you to begin your spell
		e.self:Emote("begins to chant.");
		eq.signal(154130,1,0); -- NPC: WDTrpMn
		eq.spawn2(154156,0,0,342.75,-232.48,-7.94,374); -- Spawn Spiritist V2
		eq.depop();
	end
end
