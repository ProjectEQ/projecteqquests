-- Pixtt_Kretv_Krakxt (298201)
--eq.unload_encounter("kelekdrix")

-- Pixtt Kretv Krakxt: Fight Details & Mechanics

-- Pixtt Kretv Krakxt hits for a max ~4,800. During this encounter, she will "feign death" four different times: Once at 90%, 70%, 50%, and 30%. Each time she does this, numerous mobs called "an ikaav hatchling" spawn and must be killed to progress the event. These adds each hit for a max ~1,500; single-target rampage; and are mezzable. Also appearing at this time are non-attackable mobs called "Reflection of Pixtt Kretv Krakxt" that wander the perimeter of the room casting AEs.
local active = "SERQMCNIDf"
local inactive = "ABfHG"

function event_hp(e)
	if (e.hp_event == 90) then
		--eq.spawn2(298048,0,0,xloc + math.random(-50,50),yloc + math.random(-50,50),zloc,heading);
		--an_ikaav_hatchling (298048)
		--Special Atks: 1,2,3,7,13,14,15,16,17,21 SERQMCNIDf
		-- inactive eq.modify_npc_stat("special_attacks","ABfHG")
-- Pixtt Kretv Krakxt at 90%

-- Ha ha ha, you fools thought you could overpower me. You are nothing but food for my offspring. Come my children, strike them down and suck the marrow from their bones.' Kretv's body falls to the ground -- a lifeless husk freeing the hatchlings within.

-- 4x "an ikaav hatchling" spawn and 1x "Reflection of Pixtt Kretv Krakxt" (unattackable) roams the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people. After the four hatchlings are dead, Pixtt Kretv Krakxt resumes attacking.

-- Each hatchling is stunnable and mezzable, and has about 50,000 hitpoints.
---------

	elseif (e.hp_event == 70) then
-- Pixtt Kretv Krakxt at 70%

-- Your efforts shall fail no matter how great. This is a reality you shall soon see as your vile existence ceases and my brood consumes your remains.

-- 5x "an ikaav hatchling" spawn and 2x "Reflection of Pixtt Kretv Krakxt" (unattackable) roam the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people. After the five hatchlings are dead, Pixtt Kretv Krakxt resumes attacking.
-------

	elseif (e.hp_event == 50) then
-- Pixtt Kretv Krakxt at 50%

-- You show surprising strength and conviction, but you will not get any further. The time has come for you to be destroyed.

-- 6x "an ikaav hatchling" spawn and 3x "Reflection of Pixtt Kretv Krakxt" (unattackable) roam the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people and "Ikaav Venom" (AE slow). After the six hatchlings are dead, Pixtt Kretv Krakxt resumes attacking.
----------

	elseif (e.hp_event == 30) then
-- Pixtt Kretv Krakxt at 30%

-- My resolve is waning but I shall fight you to the very last breath. The commander looks down upon weaklings in his ranks and the ikaav are not ones to indulge in it.

-- 7x "an ikaav hatchling" spawn and 4x "Reflection of Pixtt Kretv Krakxt" (unattackable) roam the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people and "Ikaav Venom" (AE slow). After the seven hatchlings are dead, Pixtt Kretv Krakxt resumes attacking.
----------

	elseif (e.hp_event == 10) then
-- Pixtt Kretv Krakxt at 10%

-- At approximately 10%, you see this:

-- The end is inevitable, but if I must be defeated, some of you will join me in the afterlife.

-- At this time, Pixtt Kretv Krakxt begins AE rampaging for full damage, and won't stop until her death. Also at this point, you get 3x "an ikaav hatchling" adds.
---------

-- Completion & Loot

-- Pixtt Kretv Krakxt has been slain by _____!

-- Kretv's body falls to the stone floor in a puddle of blackened blood. You step back as she slashes one last time, connecting with nothing but the stale air of the room. 'This is not over. My commander will destroy you for this and when he does I hope it is my power he is wielding.

-- With the death of the great beast, the seals on the doors fade away. Your path is now clear.

-- The remaining hatchlings do not despawn upon her death. They must be killed. 
----------------------------------------


--casting soul consumption from the beginning
-- wander guy pretty close to wall. pretty slow
-- hatchlings small

--reflections opposite corners
-- hatchlings close to boss
-- ref targetable
-- hatchlings summon

--door in 5
--doors out 6,7

--locs for square path

--123, 276
--123, 214
--220, 214
--220, 276
end
end
