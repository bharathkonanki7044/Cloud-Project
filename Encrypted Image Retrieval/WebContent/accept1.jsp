<%
long g=23,p=18,a=32,b=16;
long pka=0,pkb=0;
long x=0,y=0;

x=((long)Math.pow(g,a)) %p;
y=((long)Math.pow(g,b)) %p;

System.out.println(x+"========"+b);

pka=((long)Math.pow(y,a)) %p;

pkb=((long)Math.pow(x,b)) %p;

System.out.println(pka+"============="+pkb);
%>




























