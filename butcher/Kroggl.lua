local mmcc = {
  expedition = { name="Mistmoore's Catacombs: Struggles within the Progeny", min_players=6, max_players=54 },
  instance   = { zone="mmcc", version=50, duration=eq.seconds("3h") },
  compass    = { zone="lfaydark", x=3877.23, y=-127.446, z=-53.598 },
  safereturn = { zone="lfaydark", x=3847, y=-56, z=-50, h=0 },
  zonein     = { x=-424.0, y=-108.0, z=1.25, h=0 }
}

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Kroggl says, 'Me gots big jobs to do for de Wayfarers. Vampires really bad tings but dey gots lots of stuffs we want to see. Me gets to go with adventurers to see. You go too if you gots a strong head. Spooky dere. Really spooky.  If you can rally de call of your friend perhaps you can help wit a serious [" .. eq.say_link("problem") .. "].'")
  elseif e.message:findi("problem") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Kroggl says, 'De power struggles in Mistmoore's Catacombs just keep goin' and goin'. Mayong's young kiddies called de Scions want to rule over de older kiddies, de Trueborn. Me know they hate each other lots! De smart Scions learned how to make really bad monsters dat they are aiming at de Trueborn and us too. We need a powerful force to go and kill dose beasts before they come to de surface. Are yous [" .. eq.say_link("interested") .. "]?'")
  elseif e.message:findi("interested") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Kroggl says, 'No mercy.  Smash dem vampires, %s.'"):format(e.other:GetCleanName()))
    e.other:CreateExpedition(mmcc)
  end
end
