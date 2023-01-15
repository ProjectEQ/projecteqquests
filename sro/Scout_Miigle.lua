local gukc = {
  expedition = { name="Deepest Guk: The Rescue", min_players=6, max_players=54 },
  instance   = { zone="gukc", version=50, duration=eq.seconds("3h") },
  zonein     = { x=-804, y=-372, z=96, h=0 },
  compass    = { zone="innothule", x=1194, y=1322, z=-12 },
  safereturn = { zone="innothule", x=1181, y=1363, z=-12, h=0 } -- made up, live uses innothuleb
  -- compass    = { zone="innothuleb", x=572.351, y=934.646, z=19.018 },
  -- safereturn = { zone="innothuleb", x=540, y=961, z=15.125, h=0 }
}

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Scout Miigle says, 'Hail, %s. We are looking for a brave crew of adventures to assist us. We must act quickly to save a prominent Guktan from the depths of Deepest Guk. We haven't heard from him since he went down there to explore the odd occurrences.  If you can rally the call of your friends perhaps you can help us with this serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scout Miigle says, 'Very bad news! Bidip Moktu, one of the leading officials in Gukta, has been captured by a Witness of Hate! We have sent a regiment to rescue him but they have not reported back. We need you to assist us in rescuing Bidip Moktu and putting a stop to whatever unnatural magic is occurring in Deepest Guk. Please say you'll return our people safely.  Are you [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scout Miigle says, 'I hope to so Bidip Moktu again soon, and in one piece.'")
--     e.other:CreateExpedition(gukc)
--   end
-- end
