echo "This script for create multiple guest user profiles for google-chrome"
echo "Please Enter how many guest users you want to create : "
read n


for i in $(seq 1 $n)
do
	echo "Processing......."
	google-chrome --profile-directory="$i" 'https://www.youtube.com/watch?v=1equmy2cRrc&list=UUerLzeXdyXGaXvZx1FSfJ1w&index=22' &
	
	sleep 3
	echo "DONE"
	
done

echo "Finish"

