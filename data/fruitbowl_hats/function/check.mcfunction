# Skip if nothing in head slot
execute unless items entity @s armor.head * run return 0

# Skip if not a helmet
execute unless items entity @s armor.head #fruitbowl_hats:helmets run return 0

# Tagged helmet without CMD → revert back to normal
execute if items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] unless items entity @s armor.head *[custom_model_data~{}] run function fruitbowl_hats:revert
execute if items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] unless items entity @s armor.head *[custom_model_data~{}] run return 0

# Tagged helmet with CMD 0 → revert back to normal
execute if items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] if items entity @s armor.head *[custom_model_data={floats:[0.0f]}] run function fruitbowl_hats:revert
execute if items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] if items entity @s armor.head *[custom_model_data={floats:[0.0f]}] run return 0

# Tagged helmet with CMD → already processed, do nothing (CMD dispatch handles model changes)
execute if items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] run return 0

# Untagged helmet with CMD (non-zero) → apply for the first time
execute if items entity @s armor.head *[custom_model_data~{}] unless items entity @s armor.head *[custom_model_data={floats:[0.0f]}] run function fruitbowl_hats:apply
