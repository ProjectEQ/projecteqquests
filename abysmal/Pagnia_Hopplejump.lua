function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail!  It's always nice to see a Wood Elf on board!  Hopefully you can help us to defeat whatever it is that is hiding on [Taelosia].  It makes my skin crawl to think of what we might have to deal with.");
	elseif e.message:findi("Taelosia") then
		e.self:Say("That appears to be what the natives call it.  They call themselves Taelosians, and they say that they've been isolated here for a long time.  I don't like to spread rumors, but some say that they were [cursed] for doing something really bad!  I haven't met one, I'm too busy here to go ashore.  It's not safe! From the heroes that come back and talk to me, I hear that those Taelosians are very quiet and gentle folk.  I don't see how they could be guilty of any evil.  I think I overheard someone say there are some other types of Taelosians that are angry and evil though.  I can't imagine that!");
	elseif e.message:findi("cursed") then
		e.self:Say("Oh, I don't know any more than I've told you and, frankly, I don't believe a word of it!  People around here can be such gossips!  Especially that [Higbur] Fadalbee!  He's the biggest scamp I've ever met!  He tells tales that you'd never believe, not for a moment!");
	elseif e.message:findi("Higbur") then
		e.self:Say("I don't want to prattle on about people who aren't here.  That's not polite.  Higbur does just such things all the time.  Why, he recently told people that Xerbina had made a pass at him!  That's absurd, of course.  I've never met a couple so much in love as Xerbina and Taligda.  And you wouldn't believe what [Taligda] has in mind!");
	elseif e.message:findi("Taligda") then
		e.self:Say("I shouldn't really talk.  After all, it's supposed to be a [secret].  He's only told his close friends.");
	elseif e.message:findi("secret") then
		e.self:Say("Well, you seem very nice.  I guess I can trust you.  As soon as the world is saved, Taligda plans to build his own boat, smaller than this one of course, and take Xebrina on a tour of Norrath.  It's something that she's always wanted to do, but he's so terribly afraid of water!  He even plans to name the boat after his mother, Zerrina.  Isn't that wonderful!  If only everyone were so lucky as to have a companion like that.  Remember, you shouldn't repeat this to anyone, it would ruin the surprise!  Run along now, I don't want it to seem like we're gossiping.  Some people on this ship like to tell tales and accuse me of being a chatterbox.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end