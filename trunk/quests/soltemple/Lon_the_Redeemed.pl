sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Welcome. friend. I am one of the redeemed. I once walked the path of evil and woe. My talents were those of the House of V'ree of Neriak. I now serve the Burning Prince. Are you a [rogue in need of redemption] also?");
  }
  if($text=~/i am a rogue in need of redemption/i){
    quest::say("Then so be it. Ro commands you to aid the saved one. Ortallius of the hot sands. He is in need of two gems: the gem of stamina, also known as the gem of passion, and the gem of righteousness. I once owned these gems in my former life. They rest with my old friend, [Conium Darkblade]. Take this note to him and he shall give you the gems which you will then take to Ortallius.  Be off.");
    quest::summonitem(18955);
  }
  if($text=~/conium darkblade/i){
    quest::say("When evil ruled my life, I hid in the shadows with a fellow thief. This dwarf's name was Conium Darkblade. He was a genius when it came to poisons. I believe he now taints this world with his evil toxins. No doubt he hides near his homeland.");
  }
}
  
#END of FILE Zone:soltemple  ID:3307 -- Lon_the_Redeemed 

