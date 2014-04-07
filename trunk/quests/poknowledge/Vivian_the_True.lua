-- poknowledge\Vivian_the_True.lua NPCID 202295

function event_say(e)

	if(e.other:IsTaskActive(138)) then --New Beginnings
		e.self:Say("You fought alongside Arias in the Mines of Gloomingdeep! He's alive then! Thank the gods! Thank the gods and thank you, stranger! Please let me repay your kind news with my hospitality. I can help you establish yourself here in the Plane of Knowledge. Really, it's the least I can do.");
	end
	if(e.message:findi("hail")) then
		e.self:Say(	"Welcome to the Plane of Knowledge, or New Tanaan. All are welcome here, so please feel free to explore. Our home here is a safe haven to those who seek knowledge of all sorts, and many find themselves setting off upon new adventures based on what they find here. No harmful magics may be used, nor weapons. Our fair city also acts as a hub of sorts into Norrath and other destinations. Are you [" .. eq.say_link("new to the world",false,"new to the world") .. "]");
	end	
	if(e.message:findi("new to the world")) then
		if(e.other:Race() == "Beastlord") then
			eq.task_selector({200}); --Tomes of Knowledge (Beastlord)
		end
		if(e.other:Race() == "Rogue") then
			eq.task_selector({201}); --Tomes of Knowledge (Rogue)
			eq.task_selector({202}); --Training Day
		end
		
		eq.task_selector({208,209}); --(208) Errands for Castlen (209)Common Cents 
	end

end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade)
end




