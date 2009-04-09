sub EVENT_SAY
{
  if($text=~/Hail/i)
  {
    quest::say("Greetings, $name! Join in the [celebration]! Have a few drinks. Alas, there are no [Tumpy Tonics].");
  }

  if($text=~/Who is Ariska/i)
  {
    quest::say("Ariska Zimel was my best friend. He and I learned our knowledge of metal from such places as Halas and Kaladim. When he disappeared, it seemed to involve foul play. He must be alive somewhere in the city. I pray this is not the work of [Pietro Zarn].");
  }

  if($text=~/Who is Pietro Zarn/i)
  {
    quest::say("While we were traveling through the Lavastorm Mountains, we happened upon a caravan. They wore emblems in honor of the evil god, Innoruuk. They did not see us, but we saw them. And most importantly of all, Ariska saw the apparent leader's sword. It was glowing with great energy. Suddenly, the evil knights were in a battle. The knights gave chase, leaving their camp unattended. The knight who owned the sword left it behind, opting to fight with another, leading me to believe it was not his to begin with. It was at this point that Ariska ran down and grabbed the sword. A few weeks later, we were to learn that the knight was a powerful man by the name of Pietro Zarn and that he was looking for a sword stolen from him. He called it .. Soulfire. I believe Zarn must have finally found Ariska.");
  }
if($text=~/tumpy tonics/i) {
    quest::say("Ah a tumpy tonic, good drink indeed. They are made. Lets see if I can rememeber how to make them.  Ahh yes, ye take a kiola nut and stir it with water, wait a while and ya got it.  If you plan to make some then please by all means bring me one to try as I sure do miss them.");
  } 
}

sub EVENT_ITEM
{
  # Check for a Tattered Flier ID: 18818
  if(plugin::check_handin($itemcount{18818} == 1))
  {
    quest::say("This used to be hanging in Zimel's Blades. It is the price list. It is badly faded though. There was a fire in Zimel's Blades and I was on the scene just afterward. I did not see this hanging. I wonder who took it . . . Hmmmm.. oh, yes.. the markings on the list! It is a code! Here. I will fill it in. Read it. You probably do not even know who Ariska is.");

    # Return A Tattered Flier ID: 18819 to player
    quest::summonitem(18819);
  } 
 # Tumpy Tonic ID-12114
  my $Tumpy_Tonic = 0;
  if (plugin::check_handin(\%itemcount,12114=>4)) {
$Tumpy_Tonic=4;
  } 
elsif (plugin::check_handin(\%itemcount,12114=>3)) {
$Tumpy_Tonic=3;
  } 
elsif (plugin::check_handin(\%itemcount,12114=>2)) {
$Tumpy_Tonic=2;
  } 
elsif (plugin::check_handin(\%itemcount,12114=>1)) {
$Tumpy_Tonic=1;
  }
  if ($Tumpy_Tonic>=1) {
    for ($i=0; $i<$Tumpy_Tonic; $i++) {
    quest::say("Mmmm. Weee thats a good drink you made there.");
    # quest::faction(Not_Found,10); # +Tradefolk Underground   
    quest::faction(48,10); # +Coalition of Tradefolk Underground
    quest::faction(184,10); # +Knights of Truth
    quest::faction(217,10); # +Merchants of Qeynos
    quest::ding();
    quest::exp(10);
  } 

        quest::say("I have no use for this.");

        # Return items to the user
        plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:freportn  ID:8118 -- Groflah_Steadirt