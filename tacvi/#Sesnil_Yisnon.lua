function event_say(e)
  if (e.message:findi("hail")) then

    e.self:Say("The spirits of this temple whispered of your coming and you have arrived none too soon. The leader of the Muramite army has taken up residence here along with three of his officers. They have destroyed all that stood as a symbol of the Taelosians and now as we stand here, the torture continues. I am all that is left of the slaves they brought here to experiment on. As you can see from the corpses that lie here, some of us did not even make it out of this room before we collapsed from fright of what was to come. Since the Wayfarers Brotherhood's arrival on our continent, I have been waiting for someone to get this far and save us. But you are not the first and I fear you will not be the last, for you see I have helped many others make it through this sacred place and now their remains clutter the hallways of this once glorious temple. The might of this army is at its strongest here and there is no mercy for the weak who challenge them.");
    e.self:Say("Now that you have heard my tale do you wish to [" .. eq.say_link("continue") .. "]?' ");
  elseif (e.message:findi("continue")) then
    e.self:Say("I am bound to help avenge the deaths of my people by the invading masses of the Muramite army. Until this is done I must help any who enter here. If you destroy the commander then you will free my spirit and the others who are stuck here. I will remove the seal on this door when you say you are [" .. eq.say_link("ready") .. "].");

  elseif (e.message:findi("ready")) then
    e.self:MoveTo(11.57, -38.06, -6.87, 155.6, true);
    e.self:Emote("Sesnil begins to recite an incantation in his native tongue. Waving his arms in the air, you see the door light up and go dim just as his arms come to rest at his side. 'There you are. The seal has been removed. Now once again you must destroy the guardian in the doorway and do not venture back until you have destroyed the being within, or you will be destroyed by the wards.'"); 

    e.self:Say("An ancient hallway lies before you. The remains of fallen warriors litter the floor along with discarded slave corpses. ");

    local door = 0;
    local entity_list = eq.get_entity_list();
    door = entity_list:FindDoor(18);
    if (door ~= nil) then
        door:SetLockPick(0);
      end

  elseif (e.message:findi("lockout")) then

    local instance_requests = require("instance_requests");
    local lockout_globals = {
      { "Tacvi_PXK", "Tacvi: Pixtt Xxeric Kex" },
      { "Tacvi_PKK", "Tacvi: Pixtt Kretv Krakxt" },
      { "Tacvi_PRT", "Tacvi: Pixtt Riel Tavas" },
      { "Tacvi_ZMKP", "Tacvi: Zun`Muram Kvxe Pirik" },
      { "Tacvi_ZMSB", "Tacvi: Zun`Muram Shaldn Boc" },
      { "Tacvi_ZMMD", "Tacvi: Zun`Muram Mordl Delt" },
      { "Tacvi_ZMYV", "Tacvi: Zun`Muram Yihst Vor" },
      { "Tacvi_TMCV", "Tacvi: Tunat`Muram Cuu Vauax" }
    }
    instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)

  end

end
