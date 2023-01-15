local killed = 0

local function zone_death(e)
  if killed < 20 and not e.killed:IsPet() then
    killed = killed + 1
    eq.debug("killed: " .. killed)
    if killed == 20 then
      eq.zone_emote(MT.Red, "A deafening roar shakes the frost from the walls as Shargone the Ice Drake awakens from hibernation.")
      e.killed:CameraEffect(1700, 0.15)
      eq.spawn2(343000, 0, 0, 3739.0, -1011.0, -358.0, 349.0) -- Shargone,_the_Ice_Drake
    end
  end
end

local function dorsa_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "The adventurer appears to have died some time ago.  The body is curled around a message scrawled in blood that reads, 'Beware the frozen-scale.'")
  end
end

local function corpse_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Judging by the trail of blood, this corpse was likely dragged to this location from somewhere deeper in the caves.")
  end
end

local function kallendro_say(e)
  if e.message:findi("hail") then
    e.self:CastSpell(5466, e.other:GetID()) -- Fireskin
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("The adventurer shivers violently as he speaks. 'T-t-t-hank the gods you've arrived! I... I... I've been hiding here for days... only turned visible when I heard you approach. You must be careful, %s! The ice drake Shargone lairs here... The creature spends most of its time hibernating within the frozen walls... but-t-t-t it will awaken if enough of its children are slain. That's how my comrades and I were separated--Shargone tore through the ice right in our midst! You must defeat the creature and take the Orb of Midwinter. Do this or my comrades' deaths will be in vain. I'm too weak to help you fight, but here... This spell should help you.  Good luck, %s.'"):format(e.other:GetCleanName(), e.other:GetCleanName()))
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, 10,     zone_death)    -- zone_controller (hardcoded id)
  eq.register_npc_event(Event.say,        343493, dorsa_say)     -- Dorsya`s_corpse
  eq.register_npc_event(Event.say,        343478, corpse_say)    -- Varronghast`s_corpse
  eq.register_npc_event(Event.say,        343485, corpse_say)    -- Gorvash`s_Corpse
  eq.register_npc_event(Event.say,        343488, kallendro_say) -- Kallendro_Derro`mare
end
