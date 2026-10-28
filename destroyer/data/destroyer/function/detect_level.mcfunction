scoreboard players set @s destroyer.lvl 0
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"destroyer:destroyer",levels:1}]] run scoreboard players set @s destroyer.lvl 1
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"destroyer:destroyer",levels:2}]] run scoreboard players set @s destroyer.lvl 2
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"destroyer:destroyer",levels:3}]] run scoreboard players set @s destroyer.lvl 3
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"destroyer:destroyer",levels:4}]] run scoreboard players set @s destroyer.lvl 4
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"destroyer:destroyer",levels:{min:5}}]] run scoreboard players set @s destroyer.lvl 5
