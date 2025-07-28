#:: Create a scalar vaiable to store the maximum level of buffs
$maxlevelbuffs = 70;
#:: Create a hash to define spells cast at each 10 levels, and their cost
#:: Keys are by each 10 levels, with differentiation for spells ranked as generic vs. advanced
#:: Values are each spell, by id, and the cost in platinum for each rank
%buffshash = (
    #:: Hash for Warriors
    1 => 
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10costadvanced =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Clerics
    2 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Paladins
    3 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Ranger
    4 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Shadow Knight
    5 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Druid
    6 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Monk
    7 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Bard
    8 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Rogue
    9 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Shaman
    10 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Necromancer
    11 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Wizard
    12 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },  
    #:: Hash for Magician
    13 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Enchanter
    14 =>
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Beastlord
    15 => 
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    },
    #:: Hash for Berserker
    16 => 
    {
        level10generic      =>  [276,278,219,368,146,148,279,129],
        level10costgeneric  =>  0,
        level10advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level10costadvanced =>  100,
        level20generic      =>  [276,278,219,368,146,148,279,129],
        level20costgeneric  =>  0,
        level20advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level20costadvanced =>  100,
        level30generic      =>  [276,278,219,368,146,148,279,129],
        level30costgeneric  =>  0,
        level30advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level30costadvanced =>  100,
        level40generic      =>  [276,278,219,368,146,148,279,129],
        level40costgeneric  =>  0,
        level40advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level40costadvanced =>  100,
        level50generic      =>  [276,278,219,368,146,148,279,129],
        level50costgeneric  =>  0,
        level50advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level50costadvanced =>  100,
        level60generic      =>  [276,278,219,368,146,148,279,129],
        level60costgeneric  =>  0,
        level60advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level60costadvanced =>  100,
        level70generic      =>  [276,278,219,368,146,148,279,129],
        level70costgeneric  =>  0,
        level70advanced     =>  [3692,2505,423,356,172,64,145,1693,15,60,61,46,2524,22469],
        level70costadvanced =>  100,
    }
);


sub EVENT_SAY {
    #:: Create a scalar variable to store the cost of group buffs
    my $groupbuffmaxcost = 0;
    #:: Match text for "hail", case insensitive
    if ($text =~/Hail/i) { 
        quest::say("Greetings $name. I have been sent to aid you on your journey! Would you like some [".quest::saylink("lesser buffs",1)."] for ".$buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costgeneric"}."pp, or some [".quest::saylink("greater blessings",1)."] for ".$buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costadvanced"}."pp?");
        #:: Check to see if the player is grouped
        if ($client->IsGrouped()) {
            #:: Create a scalar variable to store the group
            $buffgroup = $entity_list->GetGroupByClient($client);
            #:: Create a loop to count how many members are in the group
            for ($count = 0; $count < $buffgroup->GroupCount(); $count++) {
                #:: Create a scalar variable to store the group member count
                my $groupmember = $buffgroup->GetMember($count);
                #:: Make sure that each group member is in zone before charging for them
                if ($groupmember->GetZoneID() == $zoneid) {
                    #:: Create a scalar variable to store the cost of the buffs
                    $groupbuffmaxcost += ($buffshash{$groupmember->GetClass()}->{"level".round_up($groupmember->GetLevel())."costadvanced"});
                }
            }
            quest::say("Since you are grouped, you can also get the best [".quest::saylink("group blessings",1)."] for ".$groupbuffmaxcost."pp");
        }
        quest::say("To [".quest::saylink ("cure", 1)."] you and/or your pet is free.");
        quest::say("Or I can [".quest::saylink ("bind", 1)."] you to this location at no cost.");
    }
    #:: Match text for "lesser buffs", case insensitive
    elsif ($text=~/lesser buffs/i) {
        #:: Make sure the player has enough plat for the buffs
        if ($client->GetCarriedMoney() >= (($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costgeneric"}) * 1000)) {
            #:: Create an array of the buffs to be cast on the player
            my @buffstocast = @{$buffshash{$client->GetClass()}->{"level".round_up($ulevel)."generic"}};
            #:: Create a loop to cast each buff in the hash for the pet (if it exists) and then the player
            foreach my $buff (@buffstocast) {
                #:: Check to see if the player has a pet
                if ($client->GetPetID()) {
                    #:: Create a scalar variable to store the pet by ID
                    my $pcpet = $entity_list->GetMobByID($client->GetPetID());
                    #:: Buff the pet
                    $client->SpellFinished ($buff, $pcpet);
                }
                #:: Buff the player
                quest::castspell ($buff, $userid);
            }
            #:: Take payment for the buffs
            $client->TakeMoneyFromPP((($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costgeneric"}) * 1000), 1) unless ($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costgeneric"}) == 0;
        }
        else {
            #:: Match if the player does not have enough plat
            quest::say("I charge ".($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costgeneric"})."pp for lesser buffs, you don't appear to have enough on you.");
        }
    }
    #:: Match text for "greater blessings", case insensitive
    elsif ($text =~/greater blessings/i) {
        #:: Make sure the player has enough plat for the buffs
        if ($client->GetCarriedMoney() >= (($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costadvanced"}) * 1000)) {
            #:: Create an array of the buffs to be cast on the player
            my @buffstocast = @{$buffshash{$client->GetClass()}->{"level".round_up($ulevel)."advanced"}};
            #:: Create a loop to cast each buff in the hash for the pet (if it exists) and then the player
            foreach my $buff (@buffstocast) {
                #:: Check to see if the player has a pet
                if ($client->GetPetID()) {
                    #:: Create a scalar variable to store the pet by ID
                    my $pcpet = $entity_list->GetMobByID($client->GetPetID());
                    #:: Buff the pet
                    $client->SpellFinished ($buff, $pcpet);
                }
                #:: Buff the player
                quest::castspell ($buff, $userid);
            }
            #:: Take payment for the buffs
            $client->TakeMoneyFromPP((($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costadvanced"}) * 1000), 1) unless ($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costadvanced"}) == 0;
        }
        else {
            #:: Match if the player does not have enough plat
            quest::say("I charge ".($buffshash{$client->GetClass()}->{"level".round_up($ulevel)."costadvanced"})."pp for greater blessings, you don't appear to have enough on you.");
        }
    }
    #:: Match text for "group blessings", case insensitive, and if the player is grouped
    elsif ($text =~ /group blessings/i && $client->IsGrouped()) {
        #:: Make sure the player has enough plat for the buffs
        if ($client->GetCarriedMoney() >= (($buffshash{$client->GetClass()}->{"level".$maxlevelbuffs."costadvanced"}) * 1000 * $buffgroup->GroupCount())) {
            #:: Create a loop to count the group members
            for ($count = 0; $count < $buffgroup->GroupCount(); $count++) {
                #:: Create a scalar variable to store the group member count
                my $groupmember = $buffgroup->GetMember($count);
                #:: Make sure that each group member is in zone before charging for them
                if ($groupmember->GetZoneID() == $zoneid) {
                    #:: Take payment for the buffs
                    $client->TakeMoneyFromPP((($buffshash{$groupmember->GetClass()}->{"level".round_up($groupmember->GetLevel())."costadvanced"}) * 1000), 1) unless ($buffshash{$groupmember->GetClass()}->{"level".round_up($groupmember->GetLevel())."costadvanced"}) == 0;
                    #:: Create an array of the buffs to be cast on each player
                    my @buffstocast = @{$buffshash{$groupmember->GetClass()}->{"level".round_up($groupmember->GetLevel())."advanced"}};
                    #:: Create a loop to cast each buff in the hash for each group member pet (if any exist) and then each group member
                    foreach my $buff (@buffstocast) {
                        #:: Check to see if the player has a pet
                        if ($groupmember->GetPetID()) {
                            #:: Create a scalar variable to store the pet by ID
                            my $groupmemberpet = $entity_list->GetMobByID($groupmember->GetPetID());
                            #:: Buff the pet
                            $groupmember->SpellFinished ($buff, $groupmemberpet);
                        }
                        #:: Buff the group members
                        $groupmember->SpellFinished ($buff, $groupmember);
                    }
                #:: Create an on-screen message for each group member so they know who to thank for the buffs
                $groupmember->SendMarqueeMessage(15, 510, 1, 1, 3000, "You've been buffed compliments of ".$client->GetCleanName()."!");
                }           
            }
        }
        else {
            #:: Match if the player does not have enough plat
            quest::say("I charge a maximum of ".(($buffshash{$client->GetClass()}->{"level".$maxlevelbuffs."costadvanced"}) * $buffgroup->GroupCount())."pp to cast buffs on your entire group.  You don't appear to have enough!");
        }   
    }
    #:: Match text for "cure", case insensitive
    elsif ($text=~/cure/i) { 
        #:: Check to see if the player has a pet
        if ($client->GetPetID()) {
            #:: Create a scalar variable to store the pet by ID
            my $pppet = $entity_list->GetMobByID($client->GetPetID());
            #:: Cure the pet
            $client->SpellFinished (6594, $pppet);
        }
        #:: Cure the player
        $client->SpellFinished(6594); 
    }
    #:: Match text for "bind", case insensitive
    elsif ($text=~/bind/i) {
        #:: Bind the player
        quest::selfcast(35);
    }
}

#:: This is a subroutine to round up to the nearest 10 levels
sub round_up {
    my $n = shift;
    my $scale = 10**int(log($n)/log(10));
    $n = 9 if $scale == 1;
    if ($n > $scale) {
        $n = int($n/$scale+1)*$scale;
    }
    $n;
}