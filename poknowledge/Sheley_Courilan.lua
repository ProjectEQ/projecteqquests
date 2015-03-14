-- poknowledge\Sheley_Courilan.lua NPCID 202276

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("I never should have agreed to Grumbiv's request to hand out  [" .. eq.say_link("Task",false,"Task") .. "] to passersby. I thought it'd be a part-time job that I could just kind of do when I felt up to helping out the local populace. Feh! That's what I say to that!");
		elseif(e.message:findi("task")) then
			e.self:Say("You can speak with Gibi Bilgum, Alun Bilgum, Deldryn Splendyr, Atwin Keladryn, or Balen Kalgunn in the Butcherblock Mountains.");
			e.self:Say("You can speak with Sheldon, Meelana, or Delila in the Mountains of Rathe.");
			e.self:Say("You can speak with Almon Juliao, Loric Weaver, Ponila Quickfingers, or Merra Clayfinger in the Eastern Commonlands.");
			e.self:Say("You can speak with Klok F`tshai, Marana Dreadflats, or Hoobert Flinkl in the Dreadlands.");
			e.self:Say("You can speak with Klok G`rshai, Finlay Kitoran, Uggrig Skullchomper, or Skizz Skazz in the Overthere.");
			e.self:Say("You can speak with Cadale Brohat or Assistant Vagli in the Gulf of Gunthak.");
		end
end