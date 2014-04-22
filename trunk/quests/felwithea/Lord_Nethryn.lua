function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote(" bows at the waist, his manner sincere and regal with the soft smile upon his lips. ''Greetings and good day " .. e.other:GetName() .. ", I trust that [you are well]?");
	elseif(e.message:findi("am well")) then
		e.self:Say("Excellent! It is quite a pleasant day. indeed. However. I am curious. and I do not mean [to pry]. but by what grace of Tunare have I the pleasure of your company? Perhaps you merely [travel]. or is it [me] you truly seek?");
	elseif(e.message:findi("to pry")) then
		e.self:Say("Very well, I do apologize if I did offend. May your travels be rewarding and Tunare's good grace upon you, " .. e.other:GetName() .. "");
	elseif(e.message:findi("you that I seek")) then
		e.self:Emote("blinks in surprise, a sense of pride lighting is face. ''I see. It has been some time since I have been called upon in [this realm]. I am afraid that I cannot leave [my post], however, I shall pray for Tunare?s guidance to the answers you seek.");
	elseif(e.message:findi("council")) then
		e.self:Say("The council I served upon was a council of five priests and a single knight, all of which were devout in the most sincere meaning of the word to the Earth Mother. With the rising [activities] of the most vile [Lord Mistmoore], the council was placed as a judge and jury for all who had become infected with the [disease].");
	elseif(e.message:findi("activities")) then
		e.self:Say("The Vampire Lord, Mayong Mistmoore, who continues his tyrannical and monstrous rise in power within our neighboring forest had begun to manifest is power in attempts to further his rule and dominion over the continent of Faydwer. In the Lord's attempts, he unleashed the Lycanthropy virus upon the forests, infecting many of our nation's people. In time, the virus had been eliminated and was no longer a threat, but the [souls] of those who were unfortunate enough to meet the council did not survive, but were avenged.");
	elseif(e.message:findi("souls")) then
		e.self:Say("There were too many to count. . . Far too many condemned souls. There was nothing we could do for them but ease their pain and assist to keep the virus from spreading to the other inhabitants of our nation. No cure existed, and to this day, a cure continues to evade us. I still remember the [last] victim that I had to condemn before Tunare chose me for ascension.");
	elseif(e.message:findi("last")) then
		e.self:Say("A young girl by the name of Khasra, was the youngest that our council had to attend and judge. I will never forget her face, nor the voice of her pleading mother. Forever I shall regret that decision, and regret our ignorance to her [threat].");
	elseif(e.message:findi("threat")) then
		e.self:Say("The young girl's mother had threatened to take Khasra to the Lord's domain and seek a cure there if we did not further our search for one. She would not allow her daughter to fall to the same fate as all the others had. We ignored her threat, and in turn, the girl now walks as a servant of Mistmoore, eternally embraced as one of his monstrous creations. I pray with every waking energy of my being for her, and still I know not why Tunare has chosen me for this [task and glory].");
	elseif(e.message:findi("task and glory")) then
		e.self:Say("'I am a herald, a harbinger, and a judge of the Earth Mother. I have been charged with the duty of [accepting] those who have won the eyes and favor of the gods and returning to them recognition and reward for their deeds.");
	elseif(e.message:findi("accepted")) then
		e.self:Say("Those who have been found worthy in their deeds to accept recognition from the gods are given a [coin] that they mayl give to one of the many [heroes and servants] that the gods have recently returned to this realm.");
	elseif(e.message:findi("travel")) then
		e.self:Say("A traveler then? Perhaps for adventure and fame. Indeed. I do remember those days. It has been. . . quite some time. so much that I can hardly remember. In any case. my reminiscence must be of no consequence to you. and I do not wish to keep you. Please. do be well and may Tunare's grace kindly guide you through your path.");
	elseif(e.message:findi("realm")) then
		e.self:Say("I am Lord Nethryn the Arbitrator. once a devout priest of Tunare. and now a most loyal servant. I once resided within the Realm of Heroes. but she has called upon me to [serve] again as I once did within my mortal form.");
	elseif(e.message:findi("serve")) then
		e.self:Emote("sighs heavily, a look of trouble and sorrow upon his brow. ''Several centuries past, within the first years of [his majesty's] rise to the throne, I served as the High Priest of Tunare and was head of the [council], that most dreadful council. I do not regret my past work, as I did [what needed to be done] then. It was all for the benefit of our people, both Fier'Dal and Koada'Dal alike.''");
	elseif(e.message:findi("coin") or e.message:findi("heroes and servants")) then
		e.self:Say("There are five coins. five very specific coins. each of which contains a divine light and essence. Even the hand and eye of the most crafted rogue or artist cannot forge Honor. Insight. Gallantry. Tranquility. or Faith.");
	end
end

-- END of FILE Zone:felwithea  ID:61066 -- Lord_Nethryn