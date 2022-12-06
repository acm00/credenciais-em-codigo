#!/bin/bash

DIR_CODIGO=$1
clear


if [ -z "${DIR_CODIGO}" ]
then
	echo "Faltou informar o diretorio do codigo !!!"
	echo "Sintaxe:   ./script.sh <DIR>"
	exit 1
fi
	echo "<html><center> Relatorio</center> " >> resultado.html
	echo "<head>" >> resultado.html
	echo "<style media="screen">
        body {
            font-family: 'Segoe UI','Microsoft Sans Serif',sans-serif;
            background: #444444;
	    color: white;
         }

        header:before, header:after {
            content: " ";
            display: table;
        }

        header:after {
            clear: both;
        }
	textarea {
	    display: block;
	    margin-left: auto;
    	    margin-right: auto;
            width: 100%;
            min-height: 3em;
            outline: none;
            resize: none;
            border: 1px solid gray;
            background-color: #C9CCDE;
        }
	table {
	    font-family: arial, sans-serif;
	    border-collapse: collapse;
	    border-style: double;
	    width: 70%;
	}

	td, th {
	    border: 1px solid #dddddd;
	    text-align: left;
	    padding: 8px;
	}
    </style>" >> resultado.html
	echo "</head>" >> resultado.html
	echo "<body><center>" >> resultado.html
	echo "[`date`]<h1> Inicio da  Verificação </h1>" >> resultado.html
	echo "<h2>Script para encontrar senhas no código</h2>" >> resultado.html

find ${DIR_CODIGO} -type f | while read arq
do
	while read line; 
	do 
		ret=$(grep -i -n $line ${arq});
		if [ ! -z "${ret}" ]
		then
			echo "<table>" >> resultado.html
			echo "">> resultado.html
			echo "<br>" >>resultado.html
		    echo "<tr><th> Arquivo: ${arq} </th></tr>" >> resultado.html
			echo "<br>" >>resultado.html

			echo "<tr><td><textarea>" ${ret} "</textarea></td></tr>" >> resultado.html
			echo "</table>" >> resultado.html
			echo "">> resultado.html
			echo "<br>" >>resultado.html
		fi
	done < wordlist.txt
done

echo "<br><br><br>" >>resultado.html
echo "[`date`]Fim da verificação." >> resultado.html
echo "</center></body>" >> resultado.html
echo "</html>" >> resultado.html
echo "Fim da verificação."
# exit
