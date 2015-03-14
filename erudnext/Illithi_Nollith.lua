function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhhh... Greetings, " .. e.other:GetName() .. ". Welcome to the Library of Erudin. Please respect the other patrons and speak softly."); 
	elseif(e.message:findi("testament of vanear")) then
		e.self:Say("Oh my!! You have not heard?! The Testament of Vanear was stolen from the library! It was checked out by a man named Moodoro. He is an Erudite, but I believe he was executed for some crime. Now the book is lost forever. You should speak with Tol Nicelot. He used to know Moodoro. Tol is most likely upstairs."); 
	end
end

-- End of FILE Zone:erudnext  ID:98061 -- Illithi_Nollith