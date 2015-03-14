function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there " .. e.other:GetName() .. "! You'll be happy to see that I am fully stocked with all my usual goods. Have a look around!");
	end
end

-- END of FILE Zone:erudnext  ID:98057 -- Beth_Breadmaker 

