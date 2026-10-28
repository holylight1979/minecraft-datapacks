# 當玩家開始挖掘方塊時，在該方塊正中心建立或移動追蹤標記
execute if predicate destroyer:is_sneaking run return 0
execute unless block ~ ~ ~ #destroyer:air_or_fluid run function destroyer:place_target_marker
