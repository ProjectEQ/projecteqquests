sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Leave me be, ye orc kissin' son o' Innoruuk!");
    }
  if ($text=~/I am not a son of Innoruuk/i) {
    quest::say("Eh? Ye say that ye ain't one o' the cursed dark elf dogs? Well then, laddie, are ye ready to get started or are ye here fer somethin' else??");
    }
  if ($text=~/holy swords/i) { #paladin epic
    quest::say("Eh, lad? What was that? Ye wish to hear o' holy swords? Well, lad, I ain't the one ye be needin' t' talk to!");
    }
  if ($text=~/who do I need to talk to/i) { #paladin epic
    quest::say("A follower o' the water god he be, an' one o' the most powerful holy knights e'er to walk Norrath. His name be Inte Akera, an' he kin tell ye what ye be wantin' t' know.");
    }
  if ($text=~/where is inte akera/i)  { #paladin epic
    quest::say("Ah, I see ye wish t' speak with him! Why didn't ye say that earlier, laddie? It would've saved ye some trouble! If ye wish to speak with him, ye must donate some spare change t' me ale.. er, t' me holy crusade fund! Well, lad, what d' ye say?");
    }
  if ($text=~/donate/i)  { #paladin epic
    quest::say("Eh? Oh, 500 platinum will be plenty, laddie!");
    }
  if ($text=~/ready to get started/i)  { #paladin test of spirit
    quest::say("Well then! You best go out an get me a silvery girdle, a diaphanous globe, an a ivory sky diamond! Come on back with them and you'll get a nice belt.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20943 => 1, 20869 => 1, 20868 => 1)) { #paladin test of spirit using silvery girdle, diaphanous globe, ivory sky diamond  quest::summonitem(2716);  #girdle of faith
    quest::exp(100000);
    quest::say("There ya go laddie!");
    quest::depop();
    }
  elsif($platinum == 500)  {
    quest::say("Thank ye, laddie! He's awaitin' ya up top!");
    quest::spawn2(71091,0,0,-589,767,162,63.5);
    quest::depop();
    }
   else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
} 