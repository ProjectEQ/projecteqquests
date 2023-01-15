# items: 2876
sub EVENT_SAY
{
  if($text=~/Hail/i){
    quest::say("Hello. $name. I am Mignah. a humble acrylia specialist. If you have a form of acrylia that merchants will not buy please hand it to me and I will pay you whatever it may be worth.");
  }
  if($text=~/acrylia slate/i){
    quest::emote("pulls a smoldering piece of forged acrylia from a nearby oven and, before you can react, presses your hand into the still soft metal.");
    quest::say("This may hurt a bit, but it'll heal.");
    quest::emote("etches your name and the date into the slate and plunges it into a bucket of water before placing it into your stinging palm. ");
    # Acrylia Slate
    quest::summonitem("2876");
  }
}

#END of FILE Zone:sharvahl  ID:155083 -- Mignah_Cahru

