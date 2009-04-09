# Unsar's Glory

sub EVENT_SAY {

if($text=~/hail/i) {
   quest::say("Hello, $name, I am Unsar, student of Mespha. I am working on a spell. . . I call it [Unsar's Glory]. Great name, huh?");
}

if($text=~/unsar's glory/i) {
   quest::say("Ah, Unsar's Glory. . . Mind you, I haven't perfected it yet, but bring me some [rat whiskers], [snake scales], and two [bat wings], and I'll show you how it works.");
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount,13071 => 1,13070 =>1,13068 =>2)) { # batwing 2, snake scale, rat whiskers

   quest::faction(240,2); # Order of Three
   quest::faction(135,2); # Guards of Qeynos
   quest::faction(21,-3); # Bloodsabers
   quest::exp(25);
   quest::ding();
 }

}

#END of FILE Zone:qeynos  ID:1066 -- Unsar_Koldhagon.pl