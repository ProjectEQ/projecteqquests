#zone: gunthak NPC: Grennik_Neltrin (224187)
#Started by Angelox, finished by Kilelen
#Blood Spells



sub EVENT_SAY { 
	if ($text=~/Hail/i){
		if (($class eq "Shaman") ||($class eq "Cleric") || ($class eq "Druid")){
			quest::say("Hello. Have you been exploring the island? I came here to discover the secrets of the Broken Skull trolls but I have yet to even explore the island. Rumors that their high priest Nadox held the power to cure any disease have been drifting around Norrath for some time. I've come to see if the rumors are true. Unfortunately the island is much more dangerous than I had imagined and I haven't found anything useful. If you find anything having to do with the troll High Priest, please bring it to me.");
		}
		else {
			quest::say("Hello, $name. Nice weather isn't it?  Well considering our location I mean.  I somehow doubt that the sun ever shines on this cursed rock.");
  	}
 	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59053 => 1)) {#A Glowing Black Potion
    quest::emote("holds the vial carefully between her fingers as she spins it slowly in the light. 'Yes I believe the potion is complete now. Of course we can never be certain until one of us drinks it. Since you prepared it would stand to reason for you to try it.'");

    #A little voodoo to make him/he and her/she work properly -Kilelen
    my $gender = $client->GetGender();
    my $a;
    my $b;
    my $c;
    if ($gender eq "Female"){
    	$a = "she";
    	$b = "her";
    	$c = "her";
    }
    elsif ($gender eq "Male"){
    	$a = "he";
    	$b = "his";
    	$c = "him";
    }
    	
    quest::emote("lifts the dark potion towards $name and $name reaches out and takes it from her. $name takes a deep breath and brings the potion to $b lips. The smell nearly makes $c faint, but $a regains $b composure and swallows it in one giant gulp.");
    #I raided this function from another quest file(Lanken_Rjarn.pl in erudnint) and modified the message.  I think it will work.
    $client->Message(15, "You are suddenly filled with dark warmth as the potion slides down into your stomach. You can almost sense it invading your body, battling with your defenses. You stomach turns as the venom and blood mixes in your stomach and you fight the urge to pass out. You focus all of your energy on combating the poison inside you and your body begins to turn the venom. Eventually the poison grows silent inside you and only a slight warmth is left in its place. You have conquered the poison.'");
    if ($class eq "Shaman"){
    	quest::summonitem(59525);#Spell: Blood of Nadox
    }
    elsif (($class eq "Cleric") || ($class eq "Druid")){
    	quest::summonitem(59012);#Spell: Pureblood
    }
    quest::exp(1750000);#1% of level 51 xp
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
  }
}#Done