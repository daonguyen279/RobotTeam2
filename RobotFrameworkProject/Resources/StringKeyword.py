class StringKeyword:

    ROBOT_LIBRARY_VERSION = 1.0
    
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def Split_Text(self, inputString, delimeter):
        outputString=inputString.split(delimeter)
        return outputString
    
    def Replace_Text(self, inputString, originalChar, destinationChar):
        outputString=inputString.replace(originalChar, destinationChar)
        return outputString
    
    def Greet(self,name,msg):
        result= "Hello " + name + ', ' + msg
        return result

    def Count_Number(self, str1,str2):
        str3=str1.count(str2)
        return str3

    def Uppercase_String(self, a):      
        output = a.upper()
        return output;