# 依據玩家仰角 (x_rotation) 與水平方位角 (y_rotation) 決定寬(W)、高(H)、深(D) 座標軸
# 1. 水平挖掘 (-45..45)
execute if entity @s[x_rotation=-45..45,y_rotation=135..-135] run return run function destroyer:dir/north
execute if entity @s[x_rotation=-45..45,y_rotation=-45..45] run return run function destroyer:dir/south
execute if entity @s[x_rotation=-45..45,y_rotation=45..135] run return run function destroyer:dir/west
execute if entity @s[x_rotation=-45..45,y_rotation=-135..-45] run return run function destroyer:dir/east
# 2. 往下挖掘 (45..90)
execute if entity @s[x_rotation=45..90,y_rotation=135..-135] run return run function destroyer:dir/down_ns
execute if entity @s[x_rotation=45..90,y_rotation=-45..45] run return run function destroyer:dir/down_ns
execute if entity @s[x_rotation=45..90,y_rotation=45..135] run return run function destroyer:dir/down_ew
execute if entity @s[x_rotation=45..90,y_rotation=-135..-45] run return run function destroyer:dir/down_ew
# 3. 往上挖掘 (-90..-45)
execute if entity @s[x_rotation=-90..-45,y_rotation=135..-135] run return run function destroyer:dir/up_ns
execute if entity @s[x_rotation=-90..-45,y_rotation=-45..45] run return run function destroyer:dir/up_ns
execute if entity @s[x_rotation=-90..-45,y_rotation=45..135] run return run function destroyer:dir/up_ew
execute if entity @s[x_rotation=-90..-45,y_rotation=-135..-45] run return run function destroyer:dir/up_ew
