# Skip if already wearing a fruitbowl hat
execute if items entity @s armor.head minecraft:stone_button[custom_data~{fruitbowl_hat:true}] run return 0

# Skip if no item in head slot
execute unless items entity @s armor.head * run return 0

# Skip if no custom_model_data at all
execute unless items entity @s armor.head *[custom_model_data~{}] run return 0

# Skip if CMD is 0 (default/no custom model)
execute if items entity @s armor.head *[custom_model_data={floats:[0.0f]}] run return 0

# Swap based on helmet type
execute if items entity @s armor.head minecraft:leather_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/leather
execute if items entity @s armor.head minecraft:chainmail_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/chainmail
execute if items entity @s armor.head minecraft:iron_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/iron
execute if items entity @s armor.head minecraft:golden_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/golden
execute if items entity @s armor.head minecraft:diamond_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/diamond
execute if items entity @s armor.head minecraft:netherite_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/netherite
execute if items entity @s armor.head minecraft:turtle_helmet run item modify entity @s armor.head fruitbowl_hats:to_hat/turtle
