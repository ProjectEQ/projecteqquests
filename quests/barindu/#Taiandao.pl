#BeginFile: barindu\#Taiandao.pl 
#Quest file for Barindu - Taiandao: Necromancer Epic 1.5 (Soulwhisper) 

sub EVENT_SAY { 
  if($text=~/hail/i) { 
    quest::say("What is it you want? I will be beaten if I am seen talking to you."); 
  } 
  if(($text=~/muramite killed whiahdi/i) && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 2))) { 
    quest::say("Yes, I know the one who took her life. His name is Viarglug. I hate him with every fiber of my being. If you kill him, I will forever be in debt to you. He should be somewhere nearby making life miserable for a slave."); 
    quest::unique_spawn(283156,0,0,-130,82,-122.5,180); #Viarglug 
  } 
} 

sub EVENT_ITEM { 
  quest::say("I have no use for this, $name."); 
  plugin::return_items(\%itemcount); 
} 
#EndFile: barindu\#Taiandao.pl (283101)