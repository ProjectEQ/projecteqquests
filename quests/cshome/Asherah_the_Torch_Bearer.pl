sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Greetings! Welcome to Sunset House, enjoy your stay, and the solace that our home provides. I am Asherah the Torch Bearer guardian of this realm, if you ever need me or want to chat I can be found patrolling the grounds, I stand watch over all who come to this place, and my special friends who live within this house.");
 }
 elsif($text=~/your story/i){
  quest::say("Asherah had the unfortunate distinction of being the first memorial NPC. While she was Asherah in EverQuest, in real life she was known as Grace, though her friends just called her Gams. She had earned her PhD from the University of Florida and worked as a research chemist. She hoped that this would assist her in finding a cure to a genetic metabolic disorder she had been born with. Unfortunately, it was not to be and on September 24th, 1999, at the age of 25, she lost her life to it. Asherah was promoted to Guide in June of 1999 and was assigned to Rallos Zek. When Vallon Zek opened, she transferred to it, so as to help get it off to a great start. She spent almost 35 hours a week between Guiding and playing, and always loved to spend time with the people that make EverQuest run behind the scenes, the Guides. She showed us that there is a lot more to life, and why spend time self-absorbed when you can make other people happy, and in turn become truly happy yourself, even when all odds are against you. Asher"); #The text from Allah's cuts off here, unfortunately. Will complete it if it is ever updated fully
 }
}

#Submitted by: Jim Mills