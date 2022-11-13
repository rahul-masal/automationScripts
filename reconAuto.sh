echo "Enter directory name you want to store all this data :"
read dir
mkdir /home/thor/Desktop/main/BB/day2/$dir
echo "directory created..."

echo "Enter Domain name :"
read domain
echo "Starting Amass for subdomain......."
amass enum -d $domain --passive -o /home/thor/Desktop/main/BB/day2/$dir/amass

echo "Starting httpx......."
cat /home/thor/Desktop/main/BB/day2/$dir/amass | httpx >> /home/thor/Desktop/main/BB/day2/$dir/httpx

echo "Starting waybackurls......."
cat /home/thor/Desktop/main/BB/day2/$dir/httpx | waybackurls >> /home/thor/Desktop/main/BB/day2/$dir/way
echo "______________________________________________________________"

echo "Starting dirsearch...."
echo "output path filename :"
read output
dirsearch -l /home/thor/Desktop/main/BB/day2/$dir/httpx -e txt,html,php,py,json,xml,conf,config,db,js,bak,zip,tgz,asp,aspx -i 200 --full-url -o /home/thor/Desktop/main/BB/day2/$dir/$output
echo "basic recon done..."

echo "GiTRECON..."
echo "Enter output filename :"
read gitout
python3 /opt/tools/GitDorker/GitDorker.py -tf /opt/tools/GitDorker/tf/TOKENSFILE -q $domain  -d /opt/tools/GitDorker/Dorks/medium_dorks.txt  -o ~/Desktop/main/BB/day2/$dir/$gitout
