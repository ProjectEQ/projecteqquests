-- poknowledge\Grumbiv_Wetbeard.lua NPCID 202277

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("My colleagues and I run the gamut when it comes to keeping young minds busy. You look like you could use some help in that area, and my [" .. eq.say_link("Task",false,"Task") .. "] are just the cure for your tired mind!");
		elseif(e.message:findi("task")) then
			e.self:Say("You can speak with Gibi Bilgum, Alun Bilgum, Deldryn Splendyr, Atwin Keladryn, or Balen Kalgunn in the Butcherblock Mountains.");
			e.self:Say("You can speak with Sheldon, Meelana, or Delila in the Mountains of Rathe.");
			e.self:Say("You can speak with Almon Juliao, Loric Weaver, Ponila Quickfingers, or Merra Clayfinger in the Eastern Commonlands.");
			e.self:Say("You can speak with Klok F`tshai, Marana Dreadflats, or Hoobert Flinkl in the Dreadlands.");
			e.self:Say("You can speak with Klok G`rshai, Finlay Kitoran, Uggrig Skullchomper, or Skizz Skazz in the Overthere.");
			e.self:Say("You can speak with Cadale Brohat or Assistant Vagli in the Gulf of Gunthak.");
		end
end

