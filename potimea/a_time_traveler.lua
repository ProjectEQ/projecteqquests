-- a_time_traveler
--potimea

function event_say(e)
	if(e.message:findi("hail") and not e.self:IsEngaged()) then
		if e.self:GetX() == -412 and e.self:GetY() == 1111 then
			e.self:Say("Hello, " .. e.other:GetName() .. ".  I find myself here as a result of my physical condition.  I was once a great sorceror of Erudin.  My work founded entire schools of magic and I have trained innumerable sages in the ways of the arcane.  As time passed and my life grew short I became desperate and manufactured a magical transporter that would entrap me in time until a cure for my condition could be found.  As a side effect of the transportation my short-term memory was damaged.  I... have no idea how long I've been trapped here.");
		elseif e.self:GetX() == -493 and e.self:GetY() == 1142 then
			e.self:Say("I was once a cleric in the undead army of Bertoxxulous, yet now I have been doomed to walk these lands.  I was facing an adversary that wielded a magical greatsword that glowed with an unholy aura.  The moment this blade struck my body I fell to the ground only to awaken here.");
		elseif e.self:GetX() == -559 and e.self:GetY() == 1074 then	
			e.self:Say("Greetings!  What business do you have here, " .. e.other:GetName() .. "?  I have been here for a very long time after being exposed to a glowing stone back in my home of Erudin City.  There were a number of gypsies that approached us with it in their possession.  I still do not understand how it did not transport them here as it did to us.");
		elseif e.self:GetX() == -648 and e.self:GetY() == 1113 then	
			e.self:Say("Hello, stranger. What are your reasons for venturing into this realm? I must say that I am here only for the sake of research. While I was attempting to construct a teleport device it began to shake and tremble with unbelievable force.  I touched it and then found myself here.");
		elseif e.self:GetX() == -651 and e.self:GetY() == 1201 then	
			e.self:Say("It is very nice to meet you, " .. e.other:GetName() .. ". I hope you don't mind that I am unable to talk.  I have just recently arrived here and I have many tests to do.");
		end
	end
end
