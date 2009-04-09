# Wolf Meat for Wista

sub EVENT_SAY {

   if($text=~/hail/i){
   
   quest::say("Hi, do ya likes eatin', or puhaps Hukulk sent ya? I makes many gud eats. Doh, sum I can'ts make cause sum tings I ain't gots. I cud makes some berry tastie stuff wid only [sum wolf meat].");
   }

   if ($text=~/sum wolf meat/i){

   quest::say("Gets me two wolf meats sos I cans makes me foods. I gib ya sumting.");

   }

}

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,13403 => 2)){ # Wolf Meat for Wista
   
      quest::say("Deez berry gud. Makes berry good suff. Me berry happy. Yous gets more bring dem ta mees. Yous takes dis and tanks fer da meats.");
      quest::summonitem(17004);
      quest::faction(131,10);  # +Grobb Merchants
      quest::exp(100);

   
}

plugin::return_items(\%itemcount); # return unused items


   }

#END of FILE Zone:grobb  ID:52065 -- Wista