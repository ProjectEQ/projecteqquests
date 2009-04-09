sub EVENT_SAY {
 if($text =~ /hail/i) {
   quest::say("I am sorry, young one, but I am too burdened by my own [troubles] to help you now. Please seek another of the faith to ease your soul.");
 }
 if($text =~ /troubles/i) {
   quest::say("My son Ariam, a paladin of this fair city, has been missing for many years. Now, after remaining hopeful for so long, I have given up and it has broken my heart and soul. If I could but hear news to know of his fate, then I could find comfort again. Until then, I am no good to others. I am sorry.");
 }
 
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 31493 => 1)){
   quest::say("This! This is the gift my daughter gave Ariam to aid his cause. This too is the piece of my soul that was missing. Your news of his fate is troubling, yet his heroism even beyond this life is cause for celebration. Here, keep this token. My heart is mended and I have no need of it. Once such as yourself who will continue to fight for the things in which
my son believes ought to bear this. I am sure my daughter would agree.");

  quest::summonitem(31495);
  quest::exp(300);
  quest::givecash(0,5,0,0); 
  quest::facton(8,3);
  quest::faction(43,3);
  quest::faction(178,3);
 }

}
