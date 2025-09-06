##Translocator_Gethia.pl
#Zone: ecommons

sub EVENT_SAY{
  if ($text=~/Hail/i){
  quest::say("Hello there, $name. The Academy of Arcane Sciences has sent a small team of us to help travelers navigate Norrath safely. I can transport you to [" . quest::saylink("East Commonlands Tunnel") . "]
");
  }
    
  if($text=~/East Commonlands Tunnel/i)
  {
  quest::say("Off you go!");
  quest::movepc(22,-155.04,-1514.78,3.22);
  }
        
  if($text=~/North Qeynos/i)
  {
  quest::say("Off you go!");
 quest::movepc(2,196,700,700) ;
  }
        
  if($text=~/West Freeport/i)
  {
  quest::say("Off you go!");
quest::movepc(9,197.38,108.63,-21.03) ;
  }
  
  if($text=~/Mistythicket/i)
  {
  quest::say("Off you go!");
quest::movepc(415,-1085.45,255.99,11.48) ;
  }

  if($text=~/Toxxulia Forest/i)
  {
  quest::say("Off you go!");
quest::movepc(414,-937.57,2120.08,35.02) ;
  }

     if($text=~/Neriak Commons/i)
  {
  quest::say("Off you go!");
quest::movepc(41,157.33,-1.67,31.13) ;
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
quest::movepc(68,-239.88,2889.88,-0.78) ;
  }    
  
  
  
  
} 


