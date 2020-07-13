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
ck=ca
      if hitter$=hit1$ then
          ca=ca+val(hit5$)              
         else
          cf=ca

          ca=0
        end if
    x = cf                                                 ' X = Maxium
    loop until eof (2)
   close #2
    if cf<>0 then fac=80                                   ' FAC = Ceiling
 open ter$(i) for input as #1
ut=0
 do      
  dater$=date1$

  if not (eof (1)) then input #1,date1$,county2$,state3$,del4$,cases5$,deaths6$
    
  xx=xx+val(cases5$)
  xt=xx													  ' XT = Current State Value
  if dater$<>date1$ then xx=0
    if xt<>0 then ct=fac*(x/xt)
    for graph=1 to xt/1000   
      grph$=grph$+"X"
    next graph
  if dater$<>date1$ then shell "echo "+date1$+"-"+grph$+" >> "+mid$(ter$(i),1,len(ter$(i))-4)+".txt"
 grph$=""
 loop until eof(1)
close #1
next i
