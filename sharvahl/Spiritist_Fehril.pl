#Code by Kagehi - edited by anubisrwml
#Shar_Val_Cit is used to track you up to when you get your initiate cloak and beyond.#We use it once here, to determine that you should get back your Dar Khura recruit cloak instead,#if you lose it somehow.

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Well hello... How may I help you?"); }

if($text=~/Merchant Ayyad/i){
quest::say("You can find Merchant Ayyad in 'The Merchants' Quarter which lies in the middle of the city just east of the Royal Palace."); }
}

sub EVENT_ITEM { 

if(plugin::check_handin(\%itemcount, 2877 => 1)){

quest::say("$name! So good to see you! It is my honor to guide you for a time. May the spirits inspire my words that you might grow wise in the hearing. You are young and need to be strengthened. Bring me three hairless hides of rockhopper young. You can find them in the crater surrounding our city, formed when the portion of Norrath our city is built upon came to rest in its current location.");

quest::summonitem(2877);

}

if(plugin::check_handin(\%itemcount, 3488 => 3)){

quest::say("You've completed my first task and as a reward I present you with this small token. May it serve to protect you from our enemies.");

quest::summonitem(3489); #Hopper hide Buckler.

quest::say("As a member of the sacred Dar Khura, you will be asked to become proficient in the art of brewing. Sweetwater is produced by combining xakra bile and scorpion blood with a flask of water in a brew barrel. Pour two flasks of sweetwater into this cask and return it to me.");

quest::summonitem(17232);

quest::exp(500);

quest::signalwith(155164,1,0);

}

if(plugin::check_handin(\%itemcount, 3493 => 1)){

quest::emote("takes a sip from the cask and furrows his brow.");

quest::say("Well, it's a start I suppose. With a little practice you are certain to get better. Here is some hide treatment I just made, it will make your buckler stronger. It just needs some time to ferment before I apply it.");

quest::say("Citizens often need assistance and the Dar Khura must be available whenever possible. [Merchant Ayyad] has requested someone to run an errand and I am sending you. Return to me with Ayyad's seal, the hide treatment, your buckler, and your initiate's cloak.");

quest::summonitem(3494); #Hopperhide Treatment.

quest::exp(500);

}

if(plugin::check_handin(\%itemcount, 3489 => 1, 3494 => 1, 3499 => 1, 2878 => 1)){

quest::say("Well done you $name, your deeds will not go unnoticed. You will now be known throughout the land as an official recruit of the revered Dar Khura. As your status improves so will the rewards for your service. Here is your treated buckler, your new cloak, and a spell I trust you will find a use for. Show your buckler to Fharra Cawfeet and she will continue your training.");

quest::emote("shouts, 'My fellow Vah Shir, I present to you the newest recruit to the sacred Dar Khura. $name has shown great potential in the service of our sect. Please join me in thanking this citizen for service to our people!'");

quest::summonitem(3495); #Treated Hopperhide Buckler.

quest::summonitem(3496); #Cloak of the Dar Khura Recruit.

quest::summonitem(15275); #Spell: Frost Rift.

quest::setglobal("Shar_Vahl_Cit",8,5,"F");

quest::exp(500); }

if (plugin::check_handin(\%itemcount, 5542 => 1, 3496 => 1, 5543 => 1)) {
quest::say("Your progress fills me with pride. Please take these things as a sign of our appreciation. I hope that they help you as much as you have helped us. When you are ready to continue your training, please contact Jaima Seyel. You'll most likely find her in the Dar Khura Guildhall. She will train you from this point.");
quest::shout("Fellow citizens, may I present to you with our newest apprentice to the sacred Dar Khura. $name has assisted us for some time now and we can only hope that this assistance doesn't go unnoticed. Now, please join me in thanking $name for such selfless service to our people.");
quest::faction(68,20);
quest::exp(1500);
quest::summonitem(5543);
quest::summonitem(5544);
quest::summonitem(15282); }


plugin::return_items(\%itemcount);}

#End of FILE Zone:sharvahl  ID:155070 -- Spiritist_Fehril 


