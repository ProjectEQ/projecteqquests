function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings. %s. I am Jaylia the Faithful. daughter of Raiston and Launa Lightmist.  I was born in Qeynos while it was under the rule of Antonius Bayle III.  My parents were both paladins of [Rodcet Nife] and protectors of the city.  They saw to it that I learned the ways of the [Holy Knights].",e.other:GetName()));
	elseif(e.message:findi("holy knights")) then
		e.self:Say("My parents provided me with a vast amount of knowledge.  I was taught the ways of the Holy Knights at the Temple of Thunder and the Temple of Life.  After the death of my father. I was sent to [Freeport] to study the holy ways of the Knights of Truth.");
	elseif(e.message:findi("freeport")) then
		e.self:Say("Freeport is a trade city to the east of Qeynos.  A few years after going to Freeport. I received an urgent message from Qeynos.  My mother had taken ill and I was needed in Qeynos immediately.  When I returned home. it was too late.  My mother had passed away due to a plague created by [heretics].");
	elseif(e.message:findi("heretics")) then
		e.self:Say("Many years ago. after the Erudite heretics completed the construction of Old Paineel. they began practicing with unique forms of diseases.  These dangerous experiments were not confined within the walls of the dark city.  They expanded their research to the animals in the plains of Karana.  The resident high priests were forced to come up with a cure each time a new plague surfaced.  Years later.  after I started studying the art of curing. my mother was stricken by one of these deadly creations.");
	elseif(e.message:findi("rodcet nife")) then
		e.self:Say("Rodcet Nife is The Prime Healer.  It was he who sent me to take my place in the [Realm of Heroes].");
	elseif(e.message:findi("realm of heroes")) then
		e.self:Say("The Realm of Heroes is a place for those who have proven themselves worthy of being in the presence of the gods beyond Norrath.  My [act of faithfulness] destined me to walk amongst the other Heroes in the Realm.  Many of us have journeyed back to Norrath to seek out heroes who are deemed worthy of the same.");
	elseif(e.message:findi("plan")) then
		e.self:Say("A group of warriors were sent out into the fields to kill each animal that was infected with the disease in an effort to keep it from spreading any further.  The few remaining [healthy priests] were sent out to maintain the warriors' health.  The priests became ill and had to return.  The warriors became infected themselves and struggled to perform their duties.");
	elseif(e.message:findi("healthy priests")) then
		e.self:Say("With the exception of the High Priests who were too old to make such a journey. I was one of the only healthy priests who remained.  I traveled out into the fields where the warriors were and cured them as fast as I could.  As I worked my way across the plains. I began to feel a bit dizzy and realized that I had been stricken with the plague. yet I [refused] to waste my energy on myself.");
	elseif(e.message:findi("refused")) then
		e.self:Say("At that moment. I reached my hands up into the air and shouted. 'Rodcet Nife. Prime Healer of all!  Give me the strength to go on.  Too many have suffered.  These brave warriors have fallen.  My mother has joined you.  Please. allow me to go on so that I may assist the [remaining brave souls] before I. too. join you!'");
	elseif(e.message:findi("remaining brave soul")) then
		e.self:Say("I continued on toward the remaining warriors.  Again. I cured them as quickly as I could. The tide of the battle slowly turned and the warriors began to defeat the remaining infected animals. There were bodies of fallen heroes and slain infected creatures as far as the eye could see.  I knew then that my [end] was near.");
	elseif(e.message:findi("end")) then
		e.self:Say("I stood silently with my arms to my sides and looked out across the plains.  I raised my hands into the air once more and simply said. 'I am ready now.'  I then fell to the ground and was raised to the Realm of Heroes. newly christened 'Jaylia the Faithful.'");
	end
end
