for i in $(cat paths.txt)
do
	i=${i/\~/$HOME}
	index=$(expr index $i "=")
	source=$(echo $i | cut -c -$(expr $index - 1))
	target=$(echo $i | cut -c $(expr $index + 1)-)
	case $1 in
		git) ;;
		config)
			tmp=$source
			source=$target
			target=$tmp
			;;
		*)
			printf "Usage: update.sh <git|config>"
			exit
			;;
	esac
	cp $source $target
	printf "moved %s to %s\n" $source $target
done
