#npc - Orc Death
#zone - Gfaydark
#by Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=50)){
    quest::say("Death!!  Death to all who oppose the Crushbone orcs!!");
   }else{
   quest::say("You've ruined your lands. You'll not ruin mine!");
 }
}

sub EVENT_DEATH {
my $a = $name;
my $random_result = int(rand(100));
 if (($a =~ /Fireblight/i)&&($random_result<=50)){
    quest::signal(54099,1);
    quest::say("You shall have all the Crushbone orc legions on your tail for my death!!");
}elsif(($a =~ /Rainstrider/i)&&($random_result<=50)){
    quest::signal(54098,1);
    quest::say("You shall have all the Crushbone orc legions on your tail for my death!!");
}elsif(($a =~ /Brookrock/i)&&($random_result<=50)){
    quest::signal(54124,1);
    quest::say("You shall have all the Crushbone orc legions on your tail for my death!!");
}elsif(($a =~ /Pineshade/i)&&($random_result<=50)){
    quest::signal(54118,1);
    quest::say("You shall have all the Crushbone orc legions on your tail for my death!!");
}elsif(($a =~ /Fayfear/i)&&($random_result<=50)){
    quest::signal(54096,1);
    quest::say("You shall have all the Crushbone orc legions on your tail for my death!!");
}else{
quest::say("You shall have all the Crushbone orc legions on your tail for my death!!");
 }
}