local gukc_info = { "Deepest Guk: The Rescue", 6, 54 }
local gukc_dz = { "gukc", 50, eq.seconds("3h") }
gukc_dz.zonein = { -804, -372, 96, 0 }
gukc_dz.compass = { "innothule", 1194, 1322, -12 }
gukc_dz.safereturn = { "innothule", 1181, 1163, -12, 0 } -- made up, live uses innothuleb
-- gukc_dz.compass = { "innothuleb", 572.351, 934.646, 19.018 }
-- gukc_dz.safereturn = { "innothuleb", 540, 961, 15.125, 0 }

-- not implemented
-- function event_say(e)
--   if e.message:findi("hail") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Scout Miigle says, 'Hail, %s. We are looking for a brave crew of adventures to assist us. We must act quickly to save a prominent Guktan from the depths of Deepest Guk. We haven't heard from him since he went down there to explore the odd occurrences.  If you can rally the call of your friends perhaps you can help us with this serious [" .. eq.say_link("problem") .. "].'"):format(e.other:GetCleanName()))
--   elseif e.message:findi("problem") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scout Miigle says, 'Very bad news! Bidip Moktu, one of the leading officials in Gukta, has been captured by a Witness of Hate! We have sent a regiment to rescue him but they have not reported back. We need you to assist us in rescuing Bidip Moktu and putting a stop to whatever unnatural magic is occurring in Deepest Guk. Please say you'll return our people safely.  Are you [" .. eq.say_link("interested") .. "]?'")
--   elseif e.message:findi("interested") then
--     eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scout Miigle says, 'I hope to so Bidip Moktu again soon, and in one piece.'")
--     e.other:CreateExpedition(gukc_dz, gukc_info)
--   end
-- end
