# Fruitbowl Hats v2 - Armor stand shuttle approach
# Helmets keep their item type, durability, and enchantments
scoreboard objectives add glint trigger "Toggle enchantment glint"
tellraw @a [{"text":"[Fruitbowl Hats v2]","color":"gold"},{"text":" Loaded! Helmets with CustomModelData will display 3D models. Use /trigger glint to toggle glint on held item.","color":"yellow"}]
