local item_lib = require("items")

-- mission script is independent of task state
local elements = {
  deliver_blossom      = false,
  speak_grandmaster    = false,
  deliver_ancient_note = false,
  speak_librarian      = false,
  deliver_fabled_wings = false,
}

local function keeper_trade(e)
  if not elements.deliver_blossom and item_lib.check_turn_in(e.trade, { item1 = 36211 }) then -- Perfect Cherry Blossom
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Stillmoon Forest Keeper says, 'Ah!  The perfect blossom... I can hardly believe my eyes!  For years have I searched in vain for those perfect petals only to find out that gardener was keeping it from me all this time.  I humbly thank you for your offer, kind adventurers and perhaps I can return the favor for I know who it is you seek.  With this in hand I can summon the hidden one for you.  Now go and greet him before he hides again!'")
    local wong_li = eq.unique_spawn(338406, 0, 0, 954.0, 512.0, 17.0, 264.0) -- #Wong_Li
    wong_li:CastToNPC():MoveTo(1005.25, 410.875, 17.0, 169.25, true) -- has a grid on live
    elements.deliver_blossom = true
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

local function wong_li_say(e)
  if e.message:findi("hail") and not elements.speak_grandmaster then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Wong Li says, 'Congratulations for finding me adventurer.  I simply could not resist meeting the one who had found the perfect Cherry Blossom.  I know your side wishes to unlock the secrets that lay within these temple walls but you must earn my trust before I will part with its treasures.  Lately a sickness of the spirit has infected some of my brethren.  Those few of us able to resist this illness are too weak to seek the cause of this malady and thus we need you to help us in this endeavor.  We think that the new goblin tending to the bath house, Nethran may have something to do with this.  Find him and see if he has any clues on his person.  Alas, I cannot tell you exactly how to bring him out of hiding except to say that he is easily angered.  Perhaps you can use this to lure him out...'")
    eq.unique_spawn(338428, 0, 0, 683.0, 630.0, 16.0, 0.0) -- a_wave
    elements.speak_grandmaster = true
  end
end

local function wong_li_trade(e)
  if not elements.deliver_ancient_note and item_lib.check_turn_in(e.trade, { item1 = 36212 }) then -- Ancient Note
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Wong Li says, 'Nethran had this on him, you say?  This is very dire news indeed.  This note speaks of an ancient and powerful curse that long ago descended upon this temple and its inhabitants.  I cannot translate all of the glyphs though but perhaps if you spoke with the temple librarian we might be able to uncover more about this plague.  I will send word ahead so he will be expecting you.'")
    eq.unique_spawn(338411, 0, 0, -230.0, 997.0, 43.0, 252.0) -- a_Stillmoon_librarian
    elements.deliver_ancient_note = true
  elseif not elements.deliver_fabled_wings and item_lib.check_turn_in(e.trade, { item1 = 36213 }) then -- Fables of Winged Harmony
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Wong Li says, 'Very good, adventurer. Very good indeed!  You have played your part in my plan most brilliantly but now I am forced to slay you, outsider.  You see, I cannot risk you upsetting my plans.'")
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
    e.self:SendIllusionPacket({ texture = 1, size = 11 })
    elements.deliver_fabled_wings = true
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

local function wave_spawn(e)
  local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ()
  eq.set_proximity(x - 10, x + 10, y - 10, y + 10, z - 10, z + 10)
end

local function wave_proximity(e)
  eq.clear_proximity()
  local nethran = eq.spawn2(338404, 0, 0, 652.0, 453.0, 17.0, 22.0)  -- #Nethran
  local goblin1 = eq.spawn2(338405, 0, 0, 785.0, 642.0, 17.0, 3.0)   -- goblin_laborer
  local goblin2 = eq.spawn2(338405, 0, 0, 655.0, 766.0, 17.0, 147.0) -- goblin_laborer
  nethran:CastToNPC():MoveTo(681.75,  596.75,  15.5, 5.0, true)
  goblin1:CastToNPC():MoveTo(696.75,  644.375, 19.5, 336.25, true)
  goblin2:CastToNPC():MoveTo(670.125, 645.375, 19.5, 254.75, true)
end

function librarian_say(e)
  if e.message:findi("hail") and not elements.speak_librarian then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A Stillmoon librarian says, 'Yes outsider, I have been foretold of your arrival.  The scroll you seek, however, was stolen from here but mere moments before you arrived.  Find the thieves and you will find the scroll you need!'")
    eq.spawn2(338407, 0, 0, -735, 1101, 5, 128) -- scroll_thief
    eq.spawn2(338410, 0, 0, -719, 1063, 4, 17)  -- scroll_thief_underling
    eq.spawn2(338408, 0, 0, -719, 1138, 4, 261) -- scroll_thief_underling
    eq.spawn2(338409, 0, 0, -741, 1109, 5, 140) -- scroll_thief_underling
    elements.speak_librarian = true
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.trade, 338212, keeper_trade)  -- Stillmoon_Forest_Keeper
  eq.register_npc_event(Event.say,   338406, wong_li_say)   -- #Wong_Li
  eq.register_npc_event(Event.trade, 338406, wong_li_trade)
  eq.register_npc_event(Event.say,   338411, librarian_say) -- a_Stillmoon_librarian
  eq.register_npc_event(Event.spawn, 338428, wave_spawn)    -- a_wave
  eq.register_npc_event(Event.enter, 338428, wave_proximity)
end
