-- Crispen Koloff
-- 260000

function event_say(e)
  if ( e.message:findi('hail') ) then
    e.self:Say("At last the raiding party has arrived!  I feared that Nevlen might not have made it back with the treasure samples.  We were lucky to escape with our lives with those orcs bearing down on us like they were.  In any case, it's good that you're finally here.  Since Nevlen left I've been skulking about in the shadows hiding from any patrols that wander by.  I've found out some disturbing [" .. eq.say_link('news', false, 'news') .. "] that will make your journey to the treasure that much more difficult.");
  elseif ( e.message:findi('news') ) then
    e.self:Say("It started with an increase in the number of orcs all through the caves here.  I think they caught on that someone might be trying to steal their treasure so they sent reinforcements to protect it.  But that's not the [" .. eq.say_link('worst of it', false, 'worst of it') .. "].");
  elseif ( e.message:findi('worst of it') ) then
    e.self:Say("Some of the orcs here are... different.  They've been experimenting on some of their own kind and turning them into something awful.  I overheard one of the patrols talking about samples being extracted from local fauna.  From what I could gather, when the samples are combined by some researchers and given to these orcs, they turn into ferocious beasts more powerful than any orc they'd ever seen.  [" .. eq.say_link("There's more", false, "There's more") .. "] though.");
  elseif ( e.message:findi("there's more") ) then
    e.self:Say("Indeed there is.  The beasts are being held separate from each other so none of the samples can get contaminated before they're combined by the researchers.  You're going to need to find the creatures they're extracting the samples from and destroy them.  Hopefully, at least for now, that will stop them from creating any more of these orc mutations.  That's not the [" .. eq.say_link('last of it', false, "last of it") .. "], though.");
  elseif ( e.message:findi('last of it') ) then
    e.self:Say("The last of it requires you to find the researchers and destroy them before they can proceed any further with these creations.  Who knows what kind of problems they could cause if let loose on the outside world.  Hopefully, once that's done, you'll be able to make your way to the treasure unhindered.");
  end
end
