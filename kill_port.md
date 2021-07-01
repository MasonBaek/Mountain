How to kill 'port'<br>
'lsof' list open files

<pre>
<code>
lsof -i : port number
* '-c'
* '-t'
* '-u'

opt 1 ) kill pid
opt 2 ) kill %(lsof -t -i : 8008)
</code>
</pre>
