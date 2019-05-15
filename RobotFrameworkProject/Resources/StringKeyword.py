class StringKeyword:

    ROBOT_LIBRARY_VERSION = 1.0
    
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def split_text(self, inputString, delimeter):
        outputString=inputString.split(delimeter)
        return outputString
    
    def replace_text(self, inputString, originalChar, destinationChar):
        outputString=inputString.replace(originalChar, destinationChar)
        return outputString
    
    def greet(name,msg):
        print("Hello",name + ', ' + msg)