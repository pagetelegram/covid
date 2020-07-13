dim ter$(20)
print "Grabing latest data from server..."
shell "wget https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
print "Extracting Illinois..."
shell "cat us-counties.csv | grep Illinois > illinois.csv"
print "Extracting Illinois, Cook County..."
shell "cat us-counties.csv | grep Illinois,Cook > cook.csv"
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
  shell "echo "+mid$(ter$(i),1,len(ter$(i))-4)+"-"+date$+time$+" >> "+mid$(ter$(i),1,len(ter$(i))-4)+".txt"
shell "tail "+ter$(i)+" > height.csv"
   open "height.csv" for input as #2
    do
     if not (eof(2)) then input #2, hit1$,hit2$,hit3$,hit4$,hit5$,hit6$
      x = val(hit5$)
    loop until eof (2)
   close #2
    fact=x/80

 open ter$(i) for input as #1
      
  if not (eof (1)) then input #1,date1$,county2$,state3$,del4$,cases5$,deaths6$
 c=0   

 for graph=1 to val(cases5$) step fact
       
      grph$=grph$+"+"
    next graph
 
  shell "echo "+grph$+" >> "+mid$(ter$(i),1,len(ter$(i))-4)+".txt"

 close #1
grph$=""
next i
