#npc - a_deadly_skeletal_sailor
#zone - Gunthak

sub EVENT_DEATH
{
        my $random_result = int(rand(100));
        my $a=224338;
        my $b=224008;

        if(($random_result<=20) && (defined $qglobals{Alina}&& $qglobals{Alina}==2))
        {
                quest::emote("'s corpse shatters into fragments before you.");

                #spawn 1_an_erudite_spirit (224338)
                quest::spawn2($a,0,0,-670.0,-856.1,19.2,192.6);

                quest::delglobal("Alina");
                quest::setglobal("Alina",3,3,"F");

                $qglobals{Alina}=undef;
        }
        else
        {
                quest::emote("'s corpse shatters into fragments before you.");
        }

        if(($random_result>20 && $random_result<=40) && (defined $qglobals{EthCleanse} && $qglobals{EthCleanse}==2))
        {
                quest::emote("'s corpse shatters into fragments before you.");

                #spawn 2_an_erudite_spirit (224008)
                quest::spawn2($b,0,0,-1100.0,-1100.1,19.2,192.6);

                quest::delglobal("EthCleanse");
                quest::setglobal("EthCleanse",3,3,"F");

                $qglobals{EthCleanse}=undef;
        }
        else
        {
                quest::emote("'s corpse shatters into fragments before you.");
        }

}
