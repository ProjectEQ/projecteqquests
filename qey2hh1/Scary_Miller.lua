function event_spawn(e)
  eq.set_timer("shout",45000);
end

function event_say(e)
  if(e.message:findi("trick or treat")) then
    e.self:Say("Here's something from one of our more unusual crops, see what you think.");
    e.other:SummonItem(eq.ChooseRandom(84091,84092,84093,84090,84090,84090,84090,84090,84090,84090));
    eq.update_task_activity(220,8,1);
  end
end

function event_timer(e)
  if(e.timer == "shout") then
    e.self:Shout("Trick or treat! Smell my feet! Give me something good to eat!");
  end
end
