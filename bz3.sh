#!/bin/bash
#Autor: boriasz
echo "Jakiego programu chcesz uzyc?"
echo "1.TAR 2.RAR"
read p
case "$p" in
"1") echo "TAR";;
"2") echo "RAR";;
esac
echo "Podaj co chcesz skopresowac:"
echo "1. PLIK 2. FOLDER"
read r
case "$r" in
"1") echo "PLIK";;
"2") echo "FOLDER";;
esac

if [ "$r" = "1" ]; then
	echo "Podaj sciezke dostepu pliku"
	read wej
else 
	echo "Podaj sciezke dostepu folderu"
	read wej
fi

if [ "$p" = "2" ] ; then 
echo "Wybierz stopien kompresji (m0-m5)"
read kompresja
case "$kompresja" in
"m0") echo "kompresja I stopnia";;
"m1") echo "kompresja II stopnia";;
"m2") echo "kompresja III stopnia";;
"m3") echo "kompresja IV stopnia";;
"m4") echo "kompresja V stopnia";;
"m5") echo "kompresja VI stopnia";;
*) echo "nic nie wybrales";;
esac
fi
if [ "$p" = "2" ] ; then
echo "Chcesz podzielic archiwum?"
echo "1.TAK 2.NIE"
read dzielenie
case "$dzielenie" in
"1") echo "tak";;
"2") echo "nie";;
esac
if [ "$dzielenie" = "1" ] ; then
echo "podaj rozmiar czesci (1k = 1kB, 1m = 1mB)"
fi
fi
echo "Podaj nazwe archiwum"
read nazwa
if [ $p = 2 ] ; then

	rar a -ep1 "-v$rozmiar" "-$kompresja" "$nazwa.rar" "$wej"
else
if [ "$r" = "1" ] ; then
	tar -cvf $nazwa.tar  $wej 
else
	tar -cvvf $nazwa.tar 
fi
fi
if [ "$p" = "1" ] ; then
echo "chcesz dodac jakis plik do archiwum?"
echo "1.TAK 2.NIE"	
read dalej
case "$dalej" in
"1") echo "TAK";;
"2") echo "NIE";;
esac
if [ "$dalej" = "1" ] ; then
echo "Ile bedzie tych plikow?"
read ile
for ((l=1; l<=$ile; l++)) ; do
echo "podaj sciezke dostepu do pliku"
read kolejne
tar -rvf $nazwa.tar $kolejne
done
fi 
echo "Chcesz podzielic archiwum?"
echo "1.TAK 2.NIE"
read dz
case "$dz" in
"1") echo "TAK";;
"2") echo "NIE";;
esac
if [ "$dz" = "1" ] ; then
echo "Podaj rozmiar czesci (w bajtach)"
read ro
split -d  -b$ro $nazwa.tar $nazwa.tar
fi
fi
echo "Kompresja zakonczona"
exit
