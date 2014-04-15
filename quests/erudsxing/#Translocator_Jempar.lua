function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [travel to Erudin] or [travel to Qeynos] in the meantime, I can transport you to my companion there.");
  elseif(e.message:findi("travel to erudin")) then
    eq.SelfCast(2290);
  elseif(e.message:findi("travel to qeynos")) then
    eq.SelfCast(2288);
  end
end
