function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes? I don't often converse with the servants of Highkeep, but what do you want? I am a very good friend of Carson McCabe's. If I wished it so, you could be sent to the dungeons to converse with the artisans of pain."); 
	elseif(e.message:findi("carson mccabe")) then
		e.self:Say("Who is Carson?! He is the great ruler of Highhold. It was his father who first built the community of Highhold, but it was Carson who made it what it is today. He is the smartest and most handsome gentleman you could meet and he is my lover. So keep your eyes focused on my eyes when speaking or I shall have you sent to the dungeons!"); 
	elseif(e.message:findi("who is lady mccabe")) then
		e.self:Say("Never mention that name in front of me!! Carson McCabe would be mine if it were not for that witch! She is not even from Antonica! She is an Erudite! No doubt Carson must have gotten sloshed one night and wed her by mistake. Carson assures me that he shall be rid of her as soon as his clerks can make the proper documents of separation."); 
	elseif(e.message:findi("highpass hussy")) then
		e.self:Say("What!! You dare to use that title upon me?! I shall see you dead by my own hands!!"); 
		eq.attack(e.other:GetName());
	elseif(e.message:findi("princess lenya")) then
		e.self:Say("What do you know of the Princess? Are you [working for Lady McCabe] or were you [sent by someone else]?"); 
	elseif(e.message:findi("sent by someone else")) then
		e.self:Say("I see. The Princess was being held by Lady McCabe. The one who would know of her whereabouts is a dark elf named Tyrana, but I doubt she will tell you. You will have to beat it out of her and then find a shackle key for little miss 'princess.' I regularly meet with Marlin, the locksmith, at night in room six at Rooster's in Highpass. Do me a favor and kill the disgusting creep. You will find the shackle key you need on him. Now, get out of here!"); 
	elseif(e.message:findi("working for lady mccabe")) then
		e.self:Say("Then may I suggest you pick the closest window and jump out?!!"); 
	end
end