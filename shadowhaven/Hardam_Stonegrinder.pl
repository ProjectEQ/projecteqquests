# Hardam's Goods
# Pristine Beetle Box
# items: 4757, 5986

sub EVENT_SAY {

if($text=~/Hail/i){

quest::say("In need of some ores or other mining supplies? Well step right up. I got everything ye could possibly need! Also I'll have more supplies coming in as soon as I can get some dern time to deliver my [payment] to the commissioner.");

}

if($text=~/what payment/i){

quest::say("Well ya see mate I have a representative of me great mining business here that is currently in the bazaar. however I got some new things I need him to sell but I can't leave me shop! I just need to get these new [items] to him so that he can sell them.");

}

if($text=~/what items/i){

quest::say("Well da usual items ya know. I gets a lot of different goods in here every day and it is important that I move em out as fast as possible when they worth more ya knows? If ye lewkin for a [task] I've heard about ye around town and ye seem to be a trustworthy person.");

}

if($text=~/what task/i){

quest::say("I'm simply lookin for someone to take me box of [goods] here to my friend in the bazaar. his name is Faeroi and he will know what to do with them.");

}

if($text=~/goods/i){

quest::say("I thank ya for your willingness to help. $name. Here is the box of the different things I need taken to Faeroi. When I spoke to him before he left for the bazaar this morning he told me that the helm that I had been having customized was ready. I have enclosed a note for him to give that to you to return to me. I look forward to seeing you soon.");

quest::summonitem("4757"); # Hardams Box of Goods

}

}
sub EVENT_ITEM {

   if (plugin::check_handin(\%itemcount, 5986 => 1)) { # Hardams Custom Helm
   
   quest::say("Ah, what a pleasant surprise indeed it seems my Helm is done! Many thanks for all your help once again Xeiko. And safe travels to you.");
   quest::faction(1512,5); # House of Stout
   quest::faction(1508,5); # Traders of the Haven
   quest::exp(200);
   quest::ding();
   
}


}
   
#END of FILE Zone:shadowhaven  ID:150277 -- Hardam_Stonegrinder
