#nilbog
# items: 13005

sub EVENT_SAY 
{
    if($text=~/Hail/i)
    {
        quest::say("Brrr... Good to meet another upon this wasteland.  You would not by any chance have any iron rations on you, would you?  If so, I shall heal you in trade.  I am in need of provisions.");
    }
}

sub EVENT_AGGRO 
{ 
    quest::say("Great Tribunal, help me smite this foe!");
}

sub EVENT_ITEM 
{
    if(plugin::check_handin(\%itemcount, 13005 => 1)) #iron ration
    {
        quest::say("Great Tribunal... Give me strength to bind this good person's wounds.");
        $npc->CastSpell(200,$userid); #minor healing
    }
}
