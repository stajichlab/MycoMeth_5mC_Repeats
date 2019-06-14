FINALDIR=final_libraries
INLIB=libraries
for dir in $(ls $INLIB | grep -v fa);
do
 dname=$(basename $dir)
 if [ ! -f $FINALDIR/$dname.lib ];  then
  cat $INLIB/$dir/*classified $FINALDIR/fungi.lib > $FINALDIR/$dname.lib
 fi
 echo $dir
done
