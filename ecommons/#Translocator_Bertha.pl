##Translocator_Gethia.pl
#Zone: ecommons

sub EVENT_SAY{
  if ($text=~/Hail/i){
  quest::say("As a mage of the Academy of Arcane Sciences, I've devoted my life to studying magic and exploring Norrath. Our guild, consisting of the most skilled mages and wizards on Norrath, offers teleportation services to adventurers. Jeeves stands ready outside your cities to assist you with returning to the East commons Tunnel. I can offer you a secure journey back to the citiies. Choose your destination and I will ensure your safe passage:
  
[" . quest::saylink("Ssra Temple") . "] 
[" . quest::saylink("Sanctus Seru") . "] 
[" . quest::saylink("The Nexus") . "]
[" . quest::saylink("Shar Vahl") . "]
"
);
  }

 if($text=~/Ssra Temple/i)
  {
  quest::say("Off you go!");
  quest::movepc(162, 7, 0, 5,396);
  }

  
  if($text=~/Sanctus Seru/i)
  {
  quest::say("Off you go!");
  quest::movepc(159,-301,1460,61);
  }
        
  if($text=~/The Nexus/i)
  {
  quest::say("Off you go!");
 quest::movepc(152,0,0,-28,119) ;
  }

   if($text=~/Shar Vahl/i)
  {
  quest::say("Off you go!");
  quest::movepc(155,128.23,-840.38,-188.25);
  } 
 
} 


