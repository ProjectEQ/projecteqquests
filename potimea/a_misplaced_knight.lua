--a_misplaced_knight
--potimea

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == -209 and e.self:GetY() == 671 then
			e.self:Say("I truly never did think I would see another mortal upon this plane. It has been months even years since I have seen home I imagine. It just seems that nothing significant ever happens here. Hopefully I can return home soon.");
		elseif e.self:GetX() == -166 and e.self:GetY() == 629 then
			e.self:Say("Hello, " .. e.other:GetName() .. ", are you new to this cursed plane? I sure hope you have not traveled here on your own free will because it is unknown what the purpose of this land is or why we are here. I can only wish you the best of luck in discovering your purpose.");
		elseif e.self:GetX() == -209 and e.self:GetY() == 584 then	
			e.self:Say("I am called to defend this land with all of my might and power, I will allow no one to infiltrate my defenses. Speak clearly, " .. e.other:GetName() .. ", I wish to know your intentions immediately!");
		elseif e.self:GetX() == -254 and e.self:GetY() == 630 then	
			e.self:Say("I am pleased to meet you " .. e.other:GetName() .. ", I was once a soldier in the army of Mithaniel Marr but I made some very bad mistakes and was vanquished to where you now stand before me. I still do not know why I inhabit this place and what my purpose is here. However, I do hope one day to return home.");
		end
	end
end
