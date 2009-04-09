sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Ah.. Greetings.. I am Lu'Sun, Guild Master of the Silent Fist Clan. Here, our goal is to train our body, mind, and soul to the peak of perfection.");
}
if ($text=~/Tomer Instogle/i){quest::say("Tomer? I think Seta needs someone to go find him.. Go ask her."); }
}
sub EVENT_DEATH { 
quest::summonitem("10116");	
}
sub EVENT_ITEM { 
 if ($item1=="18712"){quest::say("Greetings, and welcome to the Silent Fist Clan. Don our guild tunic, purge your mind and soul, and begin your lifelong devotion to the Clan. Brother Esrinap will introduce you to our lifestyle and begin your training. Be sound, allow your spirit to open up and guide you.");
	quest::summonitem("13507");
	quest::exp("100");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Monk');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:qeynos2  ID:2068 -- LuSun 

