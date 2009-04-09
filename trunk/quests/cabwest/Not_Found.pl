sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hello. $name. I am Sartar. In my former life I forged my body into a versatile weapon capable of defeating any foe that crossed my path. I was a student. a leader. a scholar and a scoundrel. My deeds caught the eyes of the gods and Cazic-Thule blessed me. removing me from this plane and placing me within the [Realm of Heroes].");
}
if($text=~/What realm of heroes./i){
quest::say("The Realm of Heroes is where I lived for some time. with others who had performed great deeds. I enjoyed this paradise but I wished to return and serve my lord Cazic-Thule further. Perhaps it was because of the discipline I learned from my early masters and later as a master myself. that I eventually shunned that life of pleasure. So again. I return to this mortal realm to serve my [dark lord of Fear].");
}
if($text=~/What dark lord of fear?/i){
quest::say("Hail Cazic-Thule. long may fear reign. I serve by rewarding others who have found the favor of the gods and whose actions have caught their attention and I reward them appropriately. Those to receive the favor of the gods are on their way to the glory that I have achieved in my [past]. Their journey is simply at its beginning.");
}
if($text=~/What past?/i){
quest::say("I do not know whether it was one single deed in particular that caught the eyes of the gods or if it was many deeds throughout my life in service to Cazic-Thule. I choose to leave such questions to the philosophers and personally do not care why it is that I stand before you as I do now. Simply. my reward is to serve. Still. perhaps you would like to hear one of my [tales] since you seem so interested in listening to me speak.");
}
if($text=~/What tales?/i){
quest::say("Very well. I shall relay to you a tale of my beginning. The times in which I lived were much different from today. It gives me pleasure to see the ancient cities being rebuilt and New Sebilis is a testament to the superiority of our race. When I walked the land. however. we were still wandering in the wilderness. When I was young there were [two masters] who lived solitary lives in the caves near what is now called the Emerald Jungle. I served both and neither.");
}
if($text=~/What two masters?/i){
quest::say("Their names are not important for they are masters no longer. The two knew of each other's existence but neither knew that I was receiving training from both of them at the same time. I expect that if one learned I was receiving training from the other they would have fought over who would be the one to have the pleasure of striking me dead. They would learn the [truth] eventually. only on my terms.");
}
if($text=~/What truth?/i){
quest::say("The truth was simply that I served neither master. only myself. At first it was a great challenge to slip between the two as their fighting styles differed so greatly. However. as the years passed my ruse became perfected and switching between the roots of either style became natural and automatic. Indeed. I soon reached the point when I knew that I had learned all I could from each and had exceeded them in skill. Yet I continued to pay both [visits].");
}
if($text=~/What visits?/i){
quest::say("I simply wanted to be certain that I was able to defeat both. one after the other. I knew that should I slay the one master. word would travel quickly. no doubt fears would be raised and perhaps my duplicity revealed. My unique perspective. of having studied both styles. afforded me the knowledge of how to [defeat both masters].");
}
if($text=~/How did you defeat both masters?/i){
quest::say("Defeat them both I did! I still remember the look of shock on their faces. how the pupils of their eyes dilated with fear as I switched from their native stance to that of the other style. That momentary loss of wits and that weakness was their undoing. I defeated both masters easily. This was the humble beginning of my [rise to power].");
}
if($text=~/What rise to power?/i){
quest::say("With both local masters defeated. word traveled quickly of my deeds. Those who would seek the masters for knowledge and training were suddenly without either. Through their destruction. I had laid the roots for my eventual ascension to head of my [tribe].");
}
if($text=~/What tribe?/i){
quest::say("Indeed. rather than come to these two masters for wisdom and training. they began to seek out my help. Soon. I had followers joining me from many of the other tribes and I became a leader of many. My tribe grew large and we were very powerful and successful. Often the passage of time swallows the great deeds of a hero and they are forgotten over millennia. Fortunately. the gods never forget. I have become bored with speaking to you. $name. Leave me."); }
}
#END of FILE Zone:cabwest  ID:Not_Found -- Sartar_the_Unrivaled 

