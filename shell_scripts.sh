echo "-----------------------"
echo " Rectangle Area & Perimeter Calculator"
echo "-----------------------"

echo "Enter the length of the rectangle"
read length
echo "Enter the width of the rectangle"
read width

area=$(($length*$width|bc))
perimeter=$((2*($length+$width)|bc))

echo "------------------------"
echo "Computation Result"
echo "--------------------------"
echo "Length :$length"
echo "Width :$width"
echo "Area : $area"
echo "Perimeter : $perimeter"
