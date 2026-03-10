# Restore original helmet from a fruitbowl hat
scoreboard players set @s restore_hat 0

# Only works if wearing a fruitbowl hat
execute unless items entity @s armor.head minecraft:stone_button[custom_data~{fruitbowl_hat:true}] run return run tellraw @s [{"text":"[Hats] ","color":"gold"},{"text":"You're not wearing a fruitbowl hat!","color":"red"}]

# Check original type via custom_data and apply reverse modifier
execute if items entity @s armor.head *[custom_data~{original:"leather_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/leather
execute if items entity @s armor.head *[custom_data~{original:"chainmail_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/chainmail
execute if items entity @s armor.head *[custom_data~{original:"iron_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/iron
execute if items entity @s armor.head *[custom_data~{original:"golden_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/golden
execute if items entity @s armor.head *[custom_data~{original:"diamond_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/diamond
execute if items entity @s armor.head *[custom_data~{original:"netherite_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/netherite
execute if items entity @s armor.head *[custom_data~{original:"turtle_helmet"}] run item modify entity @s armor.head fruitbowl_hats:to_helmet/turtle

tellraw @s [{"text":"[Hats] ","color":"gold"},{"text":"Helmet restored!","color":"green"}]
