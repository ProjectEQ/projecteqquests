##Translocator_Gethia.pl
#Zone: ecommons

sub EVENT_SAY{
  if ($text=~/Hail/i){
  quest::say("As a mage of the Academy of Arcane Sciences, I've devoted my life to studying magic and exploring Norrath. Our guild, consisting of the most skilled mages and wizards on Norrath, offers teleportation services to adventurers. Jeeves stands ready outside your cities to assist you with returning to the East commons Tunnel. I can offer you a secure journey back to the citiies. Choose your destination and I will ensure your safe passage:
  
[" . quest::saylink("Greater Faydark") . "] 
[" . quest::saylink("North Qeynos") . "] 
[" . quest::saylink("West Freeport") . "]
[" . quest::saylink("MistyThicket") . "]
[" . quest::saylink("Toxxulia Forest") . "]
[" . quest::saylink("Nektulos Forest") . "]
[" . quest::saylink("Innothule Swamp") . "]
[" . quest::saylink("The Feerrott") . "]
[" . quest::saylink("Halas") . "]
[" . quest::saylink("Steamfont Mountains") . "]
[" . quest::saylink("Butcherblock Mountains") . "]
[" . quest::saylink("Field of Bone") . "]
[" . quest::saylink("Firiona Vie") . "]
[" . quest::saylink("The Overthere") . "]
[" . quest::saylink("Plane of Hate") . "]
[" . quest::saylink("Plane of Fear") . "]
[" . quest::saylink("Cobaltscar") . "]
[" . quest::saylink("Plane of Sky") . "]
[" . quest::saylink("Bazaar") . "]
[" . quest::saylink("Thurgadin") . "]
[" . quest::saylink("West Wastes") . "]
"
);
  }

 if($text=~/Thurgadin/i)
  {
  quest::say("Off you go!");
  quest::movepc(118,-70,-254,98,396);
  }

  
  if($text=~/Greater Faydark/i)
  {
  quest::say("Off you go!");
  quest::movepc(54,67.30,389.55,25.33);
  }
        
  if($text=~/North Qeynos/i)
  {
  quest::say("Off you go!");
  quest::movepc(2,-54.21,436,3.33,119) ;
  }
      
  if($text=~/Halas/i)
  {
  quest::say("Off you go!");
 quest::movepc(30,673.33,3196.61,-60.77) ;
  }
				
  if($text=~/West Freeport/i)
  {
  quest::say("Off you go!");
quest::movepc(9,197.38,108.63,-21.03) ;
  }
  
  if($text=~/Mistythicket/i)
  {
  quest::say("Off you go!");
quest::movepc(33,-2127.69,362.05,-4.96) ;
  }

  if($text=~/Toxxulia Forest/i)
  {
  quest::say("Off you go!");
quest::movepc(38,242.42,2211.27,-46.37) ;
  }

     if($text=~/Nektulos Forest/i)
  {
  quest::say("Off you go!");
quest::movepc(25,-917.10,1928.21,18.31) ;
  }

     if($text=~/Bazaar/i)
  {
  quest::say("Off you go!");
quest::movepc(151,-157.84,-750.08,4.10,142) ;
  }

     if($text=~/Innothule Swamp/i)
  {
  quest::say("Off you go!");
quest::movepc(46,-170.46,-2590.76,-18.02) ;
  }  
  
     if($text=~/The Feerrott/i)
  {
  quest::say("Off you go!");
quest::movepc(47,239.81,1239.50,-0.48) ;
  }  

     if($text=~/Steamfont Mountains/i)
  {
  quest::say("Off you go!");
quest::movepc(56,554.70,-1603.22,-108.90) ;
  }  

     if($text=~/Butcherblock Mountai/i)
  {
  quest::say("Off you go!");
quest::movepc(68,-220.70,2758.13,7.16) ;
  }    
  
      
  if($text=~/Plane of Hate/i)
  {
  quest::say("Off you go!");
  quest::movepc(76,-349.22,-387.16,3.13);
  }  
   
    if($text=~/Plane of Fear/i)
  {
  quest::say("Off you go!");
  quest::movepc(72,1031.45,-827.66,101.60);
  }   
   
   
      
  if($text=~/Field of Bone/i)
  {
  quest::say("Off you go!");
  quest::movepc(78,3061.57,-2011.65,27.60);
  }

  if($text=~/Cobaltscar/i)
  {
  quest::say("Off you go!");
  quest::movepc(117,-1633.66,-1066.62,298.81);
  }
      
  if($text=~/Firiona vie/i)
  {
  quest::say("Off you go!");
  quest::movepc(84,1456.89,-2391.57,-5.85);
  } 
  if($text=~/The Overthere/i)
  {
  quest::say("Off you go!");
 quest::movepc(93,1776.32,3358.73,-48.10);
  } 
  
   if($text=~/Plane of Sky/i)
  {
  quest::say("Off you go!");
  quest::movepc(71,539,1384,-666.99);
  }  

   if($text=~/West Wastes/i)
  {
  quest::say("Off you go!");
  quest::movepc(120,-3746,-4368,-114);
  } 
 
} 


