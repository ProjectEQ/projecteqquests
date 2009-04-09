# Crush the Undead
# Created by Gonner


sub EVENT_SAY { 
if($text=~/Hail/i){
	quest::say("Hail, noble $name. Remember to spread the words of Karana throughout the faraway lands on which you shall tread. We of the Temple of Thunder are looking for new members - good people who [wish to join our cause]. Let the call go out!"); 
	}

if($text=~/join the cause/i){
	quest::say("That IS good news! If you walk the righteous path of the Rainkeeper, Karana, then you are truly noble. I have need of someone like that. I must find someone to perform a [dangerous mission] or perhaps you would rather seek out the [Rat King] or [crush the undead]");  
	}

if($text=~/crush the undead/i){
	quest::say("Those who passed generations ago have had their bones exhumed and enchanted. Some evil force plagues this land with these evil skeletons. You will fight for us and crush the skeletons. Take this box and fill it with the bones of those creatures. We will not allow them to rise again and you shall earn our respect. Go forth and fight for Karana!");
	quest::summonitem(17941); # Box for bones  
	}
if ($text=~/dangerous mission/i) {
  quest::say("You must go into the catacombs and find a man named Drosco Finlayer. Pass him this note. He has been deep undercover in the Shrine of Bertoxxulous and will have directions to that vile place. To do this will surely show your allegiance to this temple.");
  quest::summonitem(18804);
}

}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 13882 => 1)) { # A box of bones
	quest::say("You have done well. Let it be known to all that you fight for the Rainkeeper. Go and continue the battle.");  
	quest::faction(183,5); # Knights of Thunder
	quest::faction(257,5); # Preists of Life
	quest::faction(135,5); # Guards of Qeynos
	quest::faction(21,-7); # Bloodsabers
	quest::exp(100);
	quest::summonitem(13006); # Water flask
	quest::givecash(5,2,0,0); # 5 Copper 2 Silver
	}
if (plugin::check_handin(\%itemcount, 18805 =>1 )) {
  quest::say("This is terrible news. It is good you did not find your grave in the catacombs. You completed your mission regardless of the odds of survival. The temple thanks you. We shall still require your service, Knight of Thunder. Events have transpired which put all agents of righteousness in danger. We cannot explain all as yet. Take this note to Freeport. You will give it to Eestyana Naestra at the Hall of Truth. Beware, now. The Shrine of Bertoxxulous now knows of your allegiance. Give me any other item");
  quest::faction( 183,1 );
  quest::faction( 21,-1 );
  quest::faction( 257,1 );
  quest::faction( 135,1 );
  quest::exp(500);
  quest::givecash(0,0,8,0);
  quest::summonitem(6537);
}

# Do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1043 -- Wolten_Grafe 

