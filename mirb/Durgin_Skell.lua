-- npc id: 237743

local events_completed    = 0
local sludge_complete     = false
local skeletons_complete  = false
local bone_golem_complete = false
local sharalla_complete   = false
local sharalla_failed     = false
local laskuth_complete    = false
local laskuth_spawned     = false

function event_signal(e)
  -- only signalled on an event/boss completion
  events_completed = events_completed + 1

  if events_completed == 1 then
    eq.zone_emote(MT.Yellow, "One of the four tasks has been completed.")
  elseif events_completed == 2 then
    eq.zone_emote(MT.Yellow, "Two of the four tasks have been completed.")
  elseif events_completed == 3 then
    eq.zone_emote(MT.Yellow, "Three of the four tasks have been completed.")
  elseif events_completed == 4 then
    eq.zone_emote(MT.Yellow, "All four tasks have been completed.  You should return to Durgin and inform him of your success.")
  elseif events_completed == 5 then
    eq.zone_emote(MT.Yellow, "Your victory has shattered the shroud of magic surrounding the dungeon's treasure")
  end

  if e.signal == 1 then     -- sludge event
    sludge_complete = true
  elseif e.signal == 2 then -- skeleton event
    skeletons_complete = true
  elseif e.signal == 3 then -- bone golem event
    bone_golem_complete = true
  elseif e.signal == 4 then -- sharalla event completed succesfully
    sharalla_complete = true
  elseif e.signal == 5 then -- sharalla event completed but failed
    sharalla_failed = true
  elseif e.signal == 6 then -- Laskuth the Colossus killed
    laskuth_complete = true

    local dz = eq.get_expedition()
    if dz.valid then
      dz:AddReplayLockout(eq.seconds("4d12h"))
    end


    eq.spawn2(237763, 0, 0, 162, 410, -41.12, 385) --  #a_frost-glazed_box


    eq.spawn2(237790, 0, 0, 169, 452, -44.12, 208) -- #a_frozen_treasure_chest

    if sharalla_complete then

      eq.spawn2(237000, 0, 0, 157, 359, -31.50, 0) -- a_weathered _barrel (237000)
    end
  end
end

function event_say(e)
  if e.message:findi("hail") then
    if events_completed == 0 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell gasps with surprise. 'By Morden's brown beard, thank goodness you've come!  I'm the only one left alive.  I was able to duck away and hide during the chaos of battle when it became apparent that we were in too deep.  My party members were not so lucky, as each was slain by the denizens of this frozen nightmare.  We must end the reign of madness in this place and exterminate the [" .. eq.say_link("monstrosities") .. "] that have killed my brothers and sisters!'")
    elseif events_completed == 1 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell cracks a proud smile. 'That's one down, with three obligations left to tend to.  Be careful out there, and return to me when you have completed more tasks, or let me know if you wish to hear of your current [" .. eq.say_link("progress") .. "].'")
    elseif events_completed == 2 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell nods with approval. 'Halfway there now.  So far so good, but you can't afford to get cocky just yet.  There are still two more obligations to take care of.  Please return to me when the tasks are completed, or let me know if you wish to hear of your current [" .. eq.say_link("progress") .. "].'")
    elseif events_completed == 3 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell says, 'You're doing quite well, but there is still one more obligation to take care of.  Please come back and see me when the task is done, or let me know if you wish to hear of your current [" .. eq.say_link("progress") .. "].'")
    elseif events_completed == 4 and not laskuth_spawned then
      local dz = eq.get_expedition()
      if dz.valid then
        dz:SetLocked(true, ExpeditionLockMessage.Close)
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell says, 'Fantastic work, friends.  I'm not sure how, but you have accomplished the impossible by ridding the Menagerie of the most horrible abominations imaginable.  You've done a great service for the brotherhood.  I'm sure Morden will reward you handsomely for... Wait, what was that noise?'  The caverns tremble and fragments of ice rain down like hail.  A deep, thundering roar rumbles from the northeast.  'Oh dear.  It sounds like our work is not quite finished.  I'll just... wait here if you don't mind.'")
        eq.spawn2(237797, 0, 0, 216, 397, -9.75, 256) -- #Laskuth_the_Colossus
        eq.spawn2(237740, 0, 0, 162, 560, -42, 169)   -- a_sleet_flurry
        eq.spawn2(237740, 0, 0, 207, 604, -101, 162)  -- a_sleet_flurry
        eq.spawn2(237740, 0, 0, 248, 614, -101, 313)  -- a_sleet_flurry
        eq.spawn2(237740, 0, 0, 280, 617, -121, 280)  -- a_sleet_flurry
        eq.spawn2(237740, 0, 0, 205, 505, -77, 46)    -- a_sleet_flurry
        laskuth_spawned = true
      end
    elseif events_completed == 4 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell says, 'I'm afraid we aren't going anywhere until you finish the job.  We can't in good conscience leave this place without destroying all of Miragul's monsters, and there is one final horror yet to topple.  Look to the northeast, at the frozen waterfall.'")
    elseif events_completed == 5 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell smiles broadly, 'The Wayfarer's made the right decision in sending you down here.  Your courage and skill clearly mark you among the most capable adventurers in the known world.  With the multitude of dangerous beasts put to rest here in the menagerie, we can all rest a little easier.  You've done the brotherhood and all of Norrath a great service, and we are in your debt.'")
    end
  elseif e.message:findi("monstrositie") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell shivers in horror, 'The madness of this place truly knows no bounds. During our foray here, we stumbled across a mighty ancient [" .. eq.say_link("bone golem") .. "] that was beyond our capacity to handle.  In our haste to escape we ran in the wrong direction and came under attack by [" .. eq.say_link("skeletons") .. "] with strange colorations.  No matter how many times we cut them down, they reconstructed with a different hue.  Though we suffered heavy losses, we managed to track our way to an open air room.  The walls were too steep and jagged to climb out, and we were soon set upon by hunger crazed animals that had fallen into the Menagerie from this [" .. eq.say_link("maw") .. "].  We retreated with the few member we had left, and we were caught unawares by a gigantic icy [" .. eq.say_link("sludge") .. "].  All but myself were slain.'")
  elseif e.message:findi("skeletons") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell spits on the icy ground in disgust. 'Yet another example of the horrible perversions of magic that abound in this place.  There were four of them that I saw, two pairs separated in different rooms.  These skeletons may never know rest.  They regenerate anew each time they are slain.  I pray that you can find a way to destroy them permanently.'")
  elseif e.message:findi("bone(.*)golem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell says, 'Ah yes.  It was an ancient bone golem.  I'd hazard a guess that it's one of the first Miragul had ever created.  The lumbering beast was so old and decrepit, it could no longer walk.  That said, don't let its fragile appearance fool you.  It may look like an old splintering bag of bones, but I've seen firsthand that it can make quick work of anyone foolish enough to venture too close.'")
  elseif e.message:findi("maw") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell chokes back tears as if remembering something horrible. 'The maw... Is where I lost my dearest Sharalla.  We were more than fellow adventurers... She was my betrothed.  She was my...'  Durgin wipes his eyes and pauses before continuing. 'I cannot bear the thought of what those wild animals will do to her remains.  Perhaps... you could look into the matter?'")
  elseif e.message:findi("sludge") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell says, 'The sludge was just to the east of here.  It is a fearsome opponent that quickly slaughtered the few members of our raiding party left.  As I said, I was able to duck away from the fray and hide in this room.  Even if it did see me escape, it's too large to fit into this small chamber.'")
  elseif e.message:findi("progress") then
    if events_completed == 0 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell raises one eyebrow and gazes at you quizzically. 'What progress?  You've done nothing.  There is much work to do if we hope to rid this place of Miragul's abominations and none of it will be accomplished by standing around here.'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Durgin Skell says, 'Progress, hmm?  Let me see...'")
      if skeletons_complete then
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Ah, you found a way to put the chromatic skeletons to permanent rest.  Your ingenuity never ceases to amaze me.")
      end
      if bone_golem_complete then
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "From the bits of dust and bone on your armor I can tell you have successfully handled Miragul's splintering bone golem.")
      end
      if sludge_complete then
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Well now... I see you have destroyed the splitting sludge.  Quite an annoying pest, isn't it?")
      end
      if sharalla_complete then
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "So you fended off those wild animals and protected the body of Sharalla.  I can't possibly express how much that means to me.  Thank you.")
      end
      if sharalla_failed then
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Your failure to protect the body of my beloved Sharalla is disconcerting.  I'm sure you tried your best, but in this case it wasn't good enough.")
      end
      if laskuth_complete then
        eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "I heard the unmistakable sound of that behemoth crashing to the ground all the way from here.  Fantastic job.  A most commendable effort!")
      end
    end
  elseif e.message:findi("lirprin sent me") and laskuth_complete then
    local qglobals = eq.get_qglobals(e.other)
    if qglobals["Fatestealer"] == "3" then
      e.self:Say(("There's no need to mince words %s. I have no quarrel with Lirprin, but unfortunately the reverse is not also true. The man is undoubtedly angry with me. He will never forgive me for courting Sharalla and does not realize that it was her choice. She loved me, and not him. His paranoia and overbearing attitude, and eventually the outright abuse of his leadership position merely pushed her away. Now that she has fallen in the valiant service of the Brotherhood there is no further need for his insecurity."):format(e.other:GetCleanName()))
      eq.set_global("rogue_epic_durgin", "1", 5, "F")
      e.other:Message(MT.Red, "You have confirmed Durgin's innocence.")

      if qglobals["rogue_chest_mira"] == nil then
        eq.set_global("rogue_chest_mira", "1", 5, "F")
        eq.spawn2(893, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()) -- a_chest
      end
    end
  end
end
