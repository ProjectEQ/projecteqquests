#BeginFile: Crix_Tzo-mok.pl
#Quest for Lake of Ill Omen - Crix Tzo`mok: Vengeance of Crix

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello fleshling it is great to be here at our fortress once again freed from the enslavement within the goblin mines. Vengeance weighs heavily upon my mind. Would you help me bring vengeance to the goblins?");
  }
  if ($text=~/vengeance/i) {
    quest::say("Yes this is what you must do to bring vengeance. Seek out the goblin death callers in the Mines of Nurga and bring to me three Death Marks of Nurga. I will also require you to bring me the Silver Braclet of Crizz. Do this and I will reward you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  62080=> 3, 62081=> 1)) { #Death Mark of Nurga (3) and Silver Bracelet of Crizz
    quest::say("This is exactly what I wanted. Vengeance is mine! Take this small token as a reward.");
    quest::summonitem(62196); #Hideous Coif of Woe
    quest::exp(5000);
  }
  else {
    quest::say("I have no need for this, $name.");
    quest::plugin_returnitems(\%itemcount);
  }
}
#EndFile lakeofillomen - Crix_Tzo-mok.pl (85133)