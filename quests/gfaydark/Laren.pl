sub EVENT_SAY {
  if($faction == 1) { #Requires ally faction
    if($text=~/hail/i) {
      quest::say("Welcome, my friend! What is it you seek from Laren and the Scouts of Tunare?");
    }
    if($text=~/scouts blade/i) {
      quest::say("So you have heard of the dagger created especially for the rogues of Kelethin! The creator of these blades has since passed away. We mourn his death. And, I am sorry to say, we have no more to offer our new scouts. There is a way though.. A way to gain a blade and a way to [avenge the craftsman].");
    }
    if($text=~/avenge the craftsman/i) {
      quest::say("You must journey to Antonica. Seek out a castle high in the Serpent's Spine. A castle called Highkeep. Search for a man named Fenn Kaedrick. Give him this token and he shall know why you were sent. Perhaps the merchants will know of his whereabouts. Go at once. I have faith in you. Good luck, $name.");
      quest::summonitem(12185); #Useless Token
    }
  }
  else {
    quest::say("Perhaps a few less Crushbone Orcs will prove your worth.");
  }
}

sub EVENT_ITEM {
  if($faction == 1) { #Requires ally faction
    if(plugin::check_handin(\%itemcount, 12186 => 1)) { #Half Elf Head
      quest::say("You have proven yourself to be a worthy Scout of Tunare and as such you are worthy to hold the hilt of a scout blade. Remember, rogues in class are we, but in our chests beats the heart of the forest. Our skills are used in defense of Kelethin and her allies. Next you shall speak to Master Tylfon. He will inform you of the [scout silvermesh leggings].");
      quest::faction(283,10); #Scouts of Tunare
      quest::exp(20000);
      quest::givecash(0,0,28,0); #Gold x 28
      quest::summonitem(7321); #Scouts Blade
    }
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54085 -- Laren