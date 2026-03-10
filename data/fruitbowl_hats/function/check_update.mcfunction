# Already processed hat - check if CMD was removed or changed

# If CMD is gone entirely, revert to normal helmet
execute unless items entity @s armor.head *[custom_model_data~{}] run function fruitbowl_hats:revert
execute unless items entity @s armor.head *[custom_model_data~{}] run return 0

# If CMD is 0, revert to normal helmet
execute if items entity @s armor.head *[custom_model_data={floats:[0.0f]}] run function fruitbowl_hats:revert
execute if items entity @s armor.head *[custom_model_data={floats:[0.0f]}] run return 0

# CMD is still present and non-zero - no action needed
# The dispatch file handles rendering the correct model based on CMD value
# So if CMD changes (via /trigger CustomModelData), the model updates automatically!
