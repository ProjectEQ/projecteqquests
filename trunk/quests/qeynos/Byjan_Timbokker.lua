function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Greetings!  Please do not ask me to donate to the Knights of Truth or the Priests of Life.  I have enough gold going to the city of Qeynos with all these new taxes!");
  end
end