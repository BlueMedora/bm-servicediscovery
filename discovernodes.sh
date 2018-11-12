subnet=${1:?"Must pass a subnet!"}

numnodes=$(echo "dir //nmaprun/host" | xmllint --shell work/discover.xml | grep ELEMENT | wc -l)
for i in $(seq 1 ${numnodes}); do 
	if echo "cat //nmaprun/host[$i]/ports/port/state[@state='open']" | xmllint --shell work/discover.xml | grep -q open; then 
	    echo "dir //nmaprun/host[$i]/address/@addr" | xmllint --shell work/discover.xml | grep content | cut -f2 -d=; 
	fi
done

