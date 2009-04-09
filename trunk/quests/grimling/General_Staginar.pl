sub EVENT_SAY { 
if ($text=~/Hail/i && $signal == 801){
quest::say("Greetings, $name. I'm troubled that we have not yet been able to fully clear out the remaining Grimlings from the camps they still hold, I know [which camps] we have to assault to proceed, and it'll be just a matter of time before we can move forth with our plans.");
}
if ($text=~/which camps/i && $signal == 802){
quest::say("My scouts report the following to me. . .");
quest::say("We have not yet cleared camp one, to the North, of enemy forces.");
quest::say("We have not yet cleared camp two, to the North, of enemy forces.");
quest::say("We have not yet cleared camp three, to the West, of enemy forces.");
quest::say("We have not yet cleared camp four, to the West, of enemy forces.");
quest::say("We have not yet cleared camp five, to the West, of enemy forces.");
quest::say("We have not yet cleared camp six, to the West, of enemy forces.");
quest::say("We have not yet cleared camp seven, to the Northwest, of enemy forces.");
quest::say("We have not yet cleared camp eight, along the river to the North, of enemy forces.");
quest::say("We have not yet cleared camp nine, to the North, of enemy forces.");
}
if($text=~/Hail/i){
quest::say("Greetings. $name. Are you here to serve in the war against the grimling horde?");
}
if($text=~/i am here to serve in the war/i){
quest::say("As you probably know, we've been battling the grunts for nearly a generation now. They have proven to be a challenging opponent. We've inflicted great casualties upon their kind in this war, yet somehow, they seem to grow even more numerous. Barring some miracle, they will become a serious threat to Shar Vahl very soon. One remaining strategy has a chance of bringing us victory, but none have met the requirements for its implementation.");
}
if($text=~/what requirements/i){
quest::say("Our intelligence has provided us with some information about the enemy. They blindly follow a being they refer to as 'the master'. Our high spiritists have sensed a powerful presence from the caverns beyond our mines, but only those who possess a special key can venture there. None who have obtained the key and ventured into the caverns have been seen alive again.");
}
if($text=~/what key/i){
quest::say("The grimling high commander holds half of a magical acrylia obelisk that will transport the wielder to their master's stronghold. I have slain the high commander who held the other half of the obelisk and I have the knowledge of it's construction. I will only give it to one who has proven to be a powerful soldier, for nothing less would stand a chance against the enemy ruler.");
}
if($text=~/what high commander/i){
quest::say("The grimling high commander will only appear if their compound to the north is overrun. There are two encampments near the compound that will need to be invaded as well in order to secure the area. It is a very complex mission and I will only authorize you to lead it if you have demonstrated competence. Serve our people by successfully completing the lesser raids here in the forest. Bring me the Golden Medal of the Shar Vahl as proof of your prowess, or, if you are already at least as powerful as I am, there is another test that will give me confidence in your abilities.");
}
if($text=~/what test/i){
quest::say("If you are less experienced than I am, performing this task will gain you nothing. With that in mind, take this box and venture through the mines and into the caverns. Combine in it Gooplart's tooth, Gizgargank's scalp, Grikplag's skull, Gnildaria's eye, Gnerpokkel's heart, Gilgaplank's toes, the husk of the summoned burrower, and the shackles of a Vah Shir captive. Return to me with the Box of the Hero of Shar Vahl and I will send a team of our veterans to escort you into battle."); }
}
#END of FILE Zone:grimling  ID:167124 -- General_Staginar 

