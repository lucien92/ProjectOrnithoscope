#paths

path_to_existing_train='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_train_iNat_trainset.csv' 
path_to_existing_validset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_train_iNat_validset.csv'
path_to_existing_testset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_test.csv'

path_to_empty_images_train='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_true_empty_train_trainset.csv'
path_to_empty_images_validset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_true_empty_train_validset.csv'
path_to_empty_images_testset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_true_empty_test.csv'

path_to_final_trainset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_final_trainset.csv'
path_to_final_validset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_final_validset.csv'
path_to_final_testset='/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_final_testset.csv'

#mix full and empty images in new train and valid set

cat $path_to_empty_images_train $path_to_existing_train > $path_to_final_train_set


cat /home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_train_iNat_validset.csv /home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_true_empty_train_validset.csv  > /home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_final_validset.csv



cat /home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_test.csv /home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_true_empty_test.csv  > /home/lucien/Documents/project_ornithoScope_lucienbis/src/data/inputs/input_final_testset.csv