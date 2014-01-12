sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("It is good to see you $name, but I have no new information to share with you. If you have anything to show me, please do.");
 }
 #Check to see if monk is flagged for killing sun and moon via (targlobal)(need code)
 #elsif($text=~/Hail/i){ #Part of Monk Epic 1.5
 # quest::say('Ah, I see you have seen a Disciple. The Tokens you now possess are used to represent status among the Order. There used to be a tradesman that would fashion them into sashes for us but Im afraid he has since passed on. I believe there may be another that has learned his trade. His name is Eryke Stremstin, and you should be able to find him peddling his wares across the land. Take this and give it to him. He should be able to tell you of what you will need to fashion your new sash. Once you have fashioned it please bring it to me.');
 # quest::summonitem('48128'); 
 #}
 if($text=~/searching/i){ 
  # Monk Epic 1.5
  quest::say("Long ago, Kaiaren wrote down all of his teachings in this book. It was in case anything ever happened to him the teachings would not be lost forever. These are those teachings. There are several [" . quest::saylink("techniques") . "] missing though that I had hoped to find in this book. Kaiaren had once told me that there was a way to retrieve someones memories using a similar technique that originally caused his memory loss.");
 }
 if($text=~/techniques/i){ 
  # Monk Epic 1.5
  quest::say("The only other place the techniques that we seek could be retained would be within the Celestial Order itself. Yes... the [" . quest::saylink("Celestial Guardians") . "] should be safekeeping the sacred techniques.");
 }
 if($text=~/celestial guardians/i){ 
  # Monk Epic 1.5
  quest::say("They are the keepers of the disciplines. They are the ones that guard all that is right and balanced in this world. They are the enlightened and their faith is unwavering. Do you wish to [" . quest::saylink("find") . "] them?");
 }
 if($text=~/find/i){ 
  # Monk Epic 1.5
  quest::say("You can find them within their essences. The names you will most likely find them by are the Disciples of [" . quest::saylink("Sun") . "], [" . quest::saylink("Moon") . "], and [" . quest::saylink("Order") . "]. Hopefully you will be able to locate them and help retrieve the techniques we need.");
 }
 if($text=~/sun/i){ 
  # Monk Epic 1.5
  quest::say("The Disciple of Sun represents all that is pure. There is nothing stronger than the leadership of the sun. The energy that we draw from it powers everything in this world. The plants we use as herbs draw strength for it. The animals we eat grow by it and we use it to guide us. You will find him where his reign is the most apparent. He is strong and proud, so you may need to use ingenuity to draw him out.");
 }
 if($text=~/moon/i){ 
  # Monk Epic 1.5
  quest::say("The Disciple of Moon represents all that is pure. How can two disciples represent the same essence? It is simple. How can you have day without night? You cannot understand right without knowing wrong as well. How can you say you understand true happiness without ever feeling the depths of despair? You can find this Disciple where the soul is the closest to the elements.");
 }
 if($text=~/order/i){ 
  # Monk Epic 1.5
  quest::say("The Disciple of Order represents what we all try to follow as close as possible as children of the Celestial Order. Order is what we live by. It helps to keep our senses pure and strong. It makes us understand what steps we must take to become enlightened. This Disciple will be found where Order is upheld at all times. Be careful however, if you hesitate in any way you will be found flawed in his eyes. You should prepare to be tested to the limits of your capabilities. This disciple resides upon the highest of councils. He is the only member that resides upon another plane and does the bidding of a group that is the Tribunal.");
 }
 if($text=~/journey/i){ 
  # Monk Epic 1.5
  quest::say("The steps that you have taken thus far have been to prepare you for the next step. I must apologize for not telling you sooner but I had to make sure I knew you were worthy. Kaiarens diary did contain the way to unlock his mind again. To do so, you must travel back to the land that you brought the sand from. There you will have to battle the two halves of Kaiarens [" . quest::saylink("being") . "]; his mind and body.");
 }
 if($text=~/being/i){ 
  # Monk Epic 1.5
  quest::say("He has entered a [" . quest::saylink("place") . "] where chaos rules and his mind has separated from his body. His consciousness has taken the form of beings of another plane. Only after you have retrieved both essences of his mind and body, will we be able to free him again.");
 }
 if($text=~/place/i){ 
  # Monk Epic 1.5
  quest::say("This place is not something I know much about. It seems as though discord runs free there. you must be careful while you are there. There are many things we still do not yet fully understand unfolding before our eyes.");
 }
}

sub EVENT_ITEM {
 # Handin: 1/2 of Kaiaren's Diary (Right), 1/2 of Kaiaren's Diary (Left)
 if(plugin::check_handin(\%itemcount, 48109 => 1, 48110 => 1)){
  # Monk Epic 1.5
  quest::say("You have found it. Let me look at it for a minute. Ah yes, it has been a while but it is all coming back to me. Whats this though? It seems like what I was [" . quest::saylink("searching") . "] for is located elsewhere.");
 }
 # Handin: Initiate's Sash of the Celestial Order
 elsif(plugin::check_handin(\%itemcount, 48127 => 1)){
  # Monk Epic 1.5
  quest::say("I see you have gained great strength during your journey as you now wear the Sash of the Celestial Order. I am glad you have made it this far. You will need that for the next steps of your [" . quest::saylink("journey") . "].");
  quest::summonitem(48127);
 }
 # Handin: Kaiaren's Mind & Kaiaren's Body
 elsif(plugin::check_handin(\%itemcount, 48137 => 1, 48138 => 1)){
  # Monk Epic 1.5
  quest::say("You have proven time and time to be very courageous, $name. Let us hope that lasts for the final issues we must resolve. The Order has seen that Kaiaren will not be ready in time to battle the evil which is growing stronger with every passing day. you must return to the land of Discord and find Vorash. He must be stopped now before he returns to full strength.");
 }
 # Handin: Scribed Note
 elsif(plugin::check_handin(\%itemcount, 20435 => 1)){
  # Monk Epic 1.5 (END)
  quest::say("I can see that you are truly a great member of the Celestial Order now. You have helped the Order when it was needed and have helped me regain the honor which I had lost. The Order has given me the privilege now to bestow upon you the Fistwraps of the Celestial Disciple. May you enjoy your new ranking within the Order. Kaiaren will be pleased to speak to the person responsible for his saving. You may find him wandering the lands with his newfound well-being. I believe the last place he was seen was travelling in the Ocean of Tears. Be safe $name and thank you again.");
  # Summon: Fistwraps of Celestial Discipline
  quest::summonitem(61025); 
 }
 # Handin: Globe of Discordant Energy
 elsif(plugin::check_handin(\%itemcount, 47100 => 1)){
  # Monk Epic 2.0
  quest::say("By handing me this I already know of the events that have taken place this day. You must not be upset. Everything has balanced itself again. The Order has been restored and we must continue to train in the ways of the Enlightened. Take the globe back, and with it and your Fistwraps of Celestial Discipline, please find Sebast Muckle in Plane of Knowledge and hand them to him. He is a great sage and will be able to know what to do with them to reward you properly.");
  # Summon: Globe of Discordant Energy
  quest::summonitem(47100);
 }
}


# End of File