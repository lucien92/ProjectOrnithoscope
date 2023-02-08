path_to_images="/home/acarlier/code/data_ornithoscope/birds_videos/2022"

for folder in $(ls $path_to_images)
do
    for file in $(ls $path_to_images/$folder)
    do
        echo "$file" >> "/home/lucien/Documents/project_ornithoScope_lucienbis/src/data/all_videos.csv"
        
    done
done

