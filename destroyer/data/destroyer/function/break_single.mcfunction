execute if block ~ ~ ~ #destroyer:protected run return 0
execute if block ~ ~ ~ #destroyer:air_or_fluid run return 0
loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
particle minecraft:crit ~ ~ ~ 0.25 0.25 0.25 0.05 2
setblock ~ ~ ~ minecraft:air
scoreboard players add @s destroyer.broken 1
