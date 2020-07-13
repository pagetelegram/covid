dim ter$(4)
shell "rm *.csv"
print "Grabing latest data from server..."
shell "wget https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
print "Extracting Illinois..."
shell "cat us-counties.csv | grep Illinois > illinois.csv"
print "Extracting Illinois, Cook County..."
shell "cat us-counties.csv | grep Cook,Illinois > cook.csv"
print "Extracting Florida..."
shell "cat us-counties.csv | grep Florida > florida.csv"
print "Extracting Texas..."
shell "cat us-counties.csv | grep Texas > texas.csv"
ter$(0)="illinois.csv"
ter$(1)="cook.csv"
ter$(2)="florida.csv"
ter$(3)="texas.csv"
shell "rm *.txt"
for i=0 to 3
  shell "echo "+mid$(ter$(i),1,len(ter$(i))-4)+" - "+date$+" - "+time$+" >> "+mid$(ter$(i),1,len(ter$(i))-4)+".txt"
  shell "tail "+ter$(i)+" > height.csv"
   open "height.csv" for input as #2
    do
     hitter$=hit1$
      if not (eof(2)) then input #2, hit1$,hit2$,hit3$,hit4$,hit5$,hit6$
'print hit1$
'print hit2$,hit3$,hit4$,hit5$,hit6$
'sleep
ck=ca
      if hitter$=hit1$ then
          ca=ca+val(hit5$)      
          
'print ter$(i),hit1$, hit5$, cf
'sleep
         else
          cf=ca

          ca=0
        end if
    x = cf
    loop until eof (2)
   close #2
    if cf<>0 then fac=cf/1000
'print ck
'sleep
 open ter$(i) for input as #1
ut=0
 do      
'  xt=xx

  dater$=date1$

  if not (eof (1)) then input #1,date1$,county2$,state3$,del4$,cases5$,deaths6$
   
  
  xx=xx+val(cases5$)
  xt=xx
  if dater$<>date1$ then xx=0
'print ter$(i), date1$, cases5$, xt
'sleep
 ' xx=0
'if fac<>0 and xt>1 then
'print xt,fac:sleep
    for graph=1 to xt step fac
       
      grph$=grph$+"X"
    next graph
' print xt
  shell "echo "+grph$+" >> "+mid$(ter$(i),1,len(ter$(i))-4)+".txt"
  'shell "echo >> "+mid$(ter$(i),1,len(ter$(i))-4)+".txt"
 grph$=""
 loop until eof(1)
close #1

'end if
next i
