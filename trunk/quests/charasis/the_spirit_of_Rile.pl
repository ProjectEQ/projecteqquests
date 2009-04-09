#Quests covered in this file:
#Shaman Skull Quest 8

sub EVENT_ITEM
{
    #Turn in the Skull of Rile and your Skyiron Cudgel of the Arison
   if(plugin::check_handin(\%itemcount, 30995 => 1, 5148 => 1) && $shmskullquest >= 13)
   {
   quest::say("Use your cudgel to unite my soul with my body $name");
   quest::summonitem(5149);
        quest::emote("The spirit of Rile begins to shudder and shake, the bones fly from your hands to meet their rightful soul. The spirit and bones being to glow and meld into one another, forming a swirling mass of ethereal energy. Abani begins to mouth incantations in an unfamiliar tongue. Their voice rises ever higher as mystic energy surges through the room. Then, in a suddenly flash, the spirit and corpse disappear without a trace, leaving only $name holding a Faintly glowing Cudgel in his hand.");
   quest::depop();
        quest::setglobal("shmskullquest", 1,5,"F"); #lose it and you start all over!
   }
}