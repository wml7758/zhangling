<!--DiscoverySoft¹¤×÷ÊÒ-->
<!--@Copyright@2006-->
<%!
String convert(String str)
{
byte newstr[]=new byte[str.length()];
for(int i=0;i<str.length();i++)
newstr[i]=(byte)str.charAt(i);
return new String(newstr);
}
String Replace(String str)
{
int index=0;
while((index=str.indexOf("/n"))!=-1)
str=str.substring(0,index)+"<br>"+str.substring(index+1);
return(str);
}
%>