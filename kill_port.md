### How to kill 'port' ###
<br>
'lsof' list open files
<br>
<br>


* `lsof -i : port number`<br>
  -`'-c'`<br>
  -`'-t'`<br>
  -`'-u'`
<br>
`opt 1 ) kill pid`
`opt 2 ) kill %(lsof -t -i : 8008)`
